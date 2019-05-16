class AccountsController < ApplicationController

before_action :force_login
before_action :current_cart
helper_method :current_cart

  def edit
    #this is from the application_controller rb and how its' done before every action
    @user= @current_user
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count
  end



  def update
    @user = @current_user

    if @user.update(form_params)
      if form_params["stripe_token"].present?
        Stripe::Customer.update(@user.stripe_customer, {
          source: form_params["stripe_token"]
        })
      end

      flash[:success] = "Your account has been updated"
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

      @user= @current_user
      @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
      @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count

    end



def destroy
  @current_user.destroy_and_unsubscribe
  reset_session
  redirect_to root_path
end



def form_params
  params.require(:user).permit(:ig_username, :first_name, :last_name,
    :email, :password, :password_confirmation, :address_1, :address_2,
  :city, :country, :postal_code, :subscription_plan, :stripe_token, :coupon, :tune_in, :stripe_customer, :points, :photo, :about, :photogif, :check_in_q_1, :check_in_q_2, :check_in_q_3, :MHSquote_1, :MHSquote_2,
  :MHSquote_3, :MHSIG_1, :MHSIG_3, :MHSIG_2, :MHSIG_4, :MHSIG_5, :MHSbook_1, :MHSbook_2, :MHSbook_3, :MHSbook_4, :MHSbook_5, :MHSproduct_1, :MHSroduct_2, :MHSproduct_3,
:MHSproduct_4, :MHSproduct_5, :MHSroutine_1, :MHSroutine_2, :MHSroutine_3, :MHSgeneral_1, :MHSgeneral_3, :MHSgeneral_4, :MHSgeneral_5,
 :meme_1, :meme_2, :meme_3, :meme_4, :meme_5, :meme_6, :meme_7, :meme_8, :personalIG_link, :spotify_profile, :IG_link1, :IG_link2, :IG_link3, :IG_link4, :IG_link5, :video_links1,
 :vide_links2, :vide_links3, :vide_links4, :referral_code)
end

end
