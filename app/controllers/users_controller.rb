class UsersController < ApplicationController


  def index
    @users = User.all
    #find ALL the users in this index
  end


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
      render "new"
    end
  end

  def show
    @user= User.find_by(ig_username: params[:id])
  end



def rewards
@user= @current_user
end



def form_params
  params.require(:user).permit(:ig_username, :first_name, :last_name,
    :email, :password, :password_confirmation, :address_1, :address_2,
  :city, :country, :postal_code, :subscription_plan, :stripe_token, :coupon, :tune_in, :stripe_customer, :points)
end

end
