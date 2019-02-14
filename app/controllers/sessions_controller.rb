class SessionsController < ApplicationController


  def new
  end

def create

    @username = form_params[:ig_username]
@password = form_params[:password]

@user = User.find_by(ig_username: @username).try(:authenticate, @password)
if @user.present?
  session[:user_id] = @user.id
  flash[:success] = "You are now logged in!"
  redirect_to bettyland_path
else
  render "new"
  flash[:success] = "Wrong username and password!"
end
end

  def destroy
    reset_session
    flash[:success] = "You are now logged out"
    redirect_to root_path
end


def form_params
params.require(:session).permit(:ig_username, :password)

end

end
