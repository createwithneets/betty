class UsersController < ApplicationController

  before_action :force_login, :except => [:new, :create]
  before_action :current_cart
  helper_method :current_cart

  def index
    @users = User.all
    @users = User.search(params[:search]).paginate(page: params[:page], per_page: 30)
    @user = @current_user
    end

    #find ALL the users in this index


  def new
    @user= User.new
  end


  def create
    @user= User.new(form_params)
    if @user.save_and_subscribe
      session[:user_id]= @user.id
      flash[:success]= "Thanks for Signing Up!"
      redirect_to welcome_path
    else
      redirect_to error_path
    end
  end

  def show
    @user= User.find_by(ig_username: params[:id])
  end


def edit
  @user= @current_user
end


def update
  @user= User.find(params[:id])
  if @user.update(form_params)
    flash[:success] = "User Details Updated"
    redirect_to users_path
  else
    flash[:success] = "There's been an error. Please double check!"
    render 'edit'
end
end


def rewards
@user= @current_user
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
    @user= User.find(params[:id])
    @user.destroy_and_unsubscribe
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
