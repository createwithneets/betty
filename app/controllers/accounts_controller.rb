class AccountsController < ApplicationController

before_action: check_login

  def edit
    #this is from the application_controller rb and how its' done before every action
    @user= @current_user
  end

  def update

    @user= @current_user

    if @user.update_with_stripe(form_params)
      flash[:success] = "Your account has been updated"
      redirect_to bettyland_path
    else
      render "edit"
  end
end


def destroy
  @current_user.destroy_and_unsubscribe
  reset_session
  redirect_to root_path
end



def form_params
  params.require(:user).permit(:password, :password_confirmation, :photo, :about)
end

end
