class SessionsController < ApplicationController


def new
end

def create

@ig_username = form_params[:ig_username]
@password = form_params[:password]

@user = User.find_by(ig_username: @ig_username).try(:authenticate, @password)
if @user.present?
session[:user_id] = @user.id
redirect_to bettyland_path
else
flash[:success] = "Wrong username and password!"
render "new"
end
end

def destroy
reset_session
flash[:success] = "You are now logged out"
redirect_to root_path
end


 def form_params
 params.require(:session).permit(:ig_username, :password, :password_confirmation)

 end

 end
