class ApplicationController < ActionController::Base


  helper_method :current_user, :is_logged_in?, :force_login, :current_cart
  before_action :current_user, :current_cart
  helper_method :forum_path
  #create a helper method so that we can use it in our views

  def forum_path
    "/forum"
  end

  def current_user
    if session[:user_id].present?
      @current_user= User.find(session[:user_id])
    else
      @current_user= nil
    end
  rescue ActiveRecord::RecordNotFound
    @current_user = nil  
  end


  def is_logged_in?
    session[:user_id].present?
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
rescue ActiveRecord::RecordNotFound
  @current_cart= Cart.create
  #create means new and save together
  session[:cart_id]= @current_cart.id  
end



def force_login
unless is_logged_in?
  redirect_to root_path
end
end
