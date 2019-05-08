class OrdersController < ApplicationController

  #this is the page that we see
    def new
      @user= current_user
      @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
      @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count
      @order= Order.new
      @order.add_from_cart(@current_cart)
    end

    #this is the actual action of creating a new line in the database
    def create

      @order= Order.new(form_params)
    @order.add_from_cart(@current_cart)
    #this means that it adds the things from teh cart, as well as what was filled out in the form
    @amount= @current_cart.total_price
    @final_amount = @amount

    @code = @order.couponCode

    if !@code.blank?
      @discount = get_discount(@code)

      if @discount.nil?
        flash[:error] = 'Coupon code is not valid or expired.'
        redirect_to new_order_path
        return
      else
        @final_amount = @amount - @discount.to_i
      end

      charge_metadata = {
        :coupon_code => @code,
        :coupon_discount => (@discount).to_s
      }
    end

    charge_metadata ||= {}

    Stripe::Charge.create(amount: @final_amount, currency: "usd",
    source: @order.stripe_token, description: "Order for" + @order.email, metadata: charge_metadata)
    flash[:success] = "Order Completed"
    reset_session
    OrderMailer.receipt(@order, @final_amount).deliver_now
    OrderMailer.confirmation(@order, @final_amount).deliver_now

    redirect_to purchaseconfirmation_path


rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_path
end
    end


    def show
      @order= Order.find(params[:id])
    end


      def form_params
        params.require(:order).permit(:first_name, :last_name, :email,
        :address_1, :address_2, :country, :city, :postal_code, :stripe_token, :couponCode)
      end


private

COUPONS = {
  'BETTY10' => 500,
  'BETTYTWENTY' => 1000,
  'B30' => 1500,
  'BETTYFORTY' => 2000,
  'B50' => 2500,
  'BETTY60' => 3000,
  'B70' => 3500,
  'BETTY80' => 4000,
  'B85' => 4500,
  'BETTY90' => 5000,
  'B95' => 5500,
  'BETTY100' => 6000,
}

def get_discount(code)
  # Normalize user input
  code = code.gsub(/\s+/, '')
  code = code.upcase
  COUPONS[code]
end
