class ProductsController < ApplicationController


  def index
    @products= Product.all
    @user= current_user
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count
  end

  def show
      @product = Product.find(params[:id])

      # if the product is already in the cart
      @order_item = @current_cart.order_items.find_by(product: @product)

      if @order_item.nil?
      # if it doesn't exist in the cart
      @order_item = @current_cart.order_items.new(product: @product, quantity: 1)

        @user= current_user
    end

end

  end
