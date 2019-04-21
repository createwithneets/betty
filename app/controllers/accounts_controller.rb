class AccountsController < ApplicationController

before_action :force_login
before_action :current_cart
helper_method :current_cart

  def edit
    #this is from the application_controller rb and how its' done before every action
    @user= @current_user
  end



  def update
    @user= @current_user
      @customer_id = @user.stripe_customer
      if @user.update(form_params)

        #update stripe Details
    customer = Stripe::Customer.retrieve(@customer_id)
    customer.source = @user.stripe_token
    customer.save

    flash[:success] = "Payment details updated"
    redirect_to users_path
    else
      flash[:warning] = 'Error detected. Please double-triple check everything below!'
      render "edit"
    end
  end


  def current_cart
      #if the customer has just landed on the site, give them a brand new cart_id
      #if they already have one, keep it
      #check sesion[:cart_id]

      if session[:cart_id].present?
        #they already have a cart-great!
        @current_cart= Cart.find(session[:cart_id])
      else
        @current_cart= Cart.create
        #create means new and save together
        session[:cart_id]= @current_cart.id
      end

    end



def destroy
  @current_user.destroy_and_unsubscribe
  reset_session
  redirect_to root_path
end



def form_params
  params.require(:user).permit(:stripe_token)
end

end
