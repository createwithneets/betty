class ApplicationController < ActionController::Base


helper_method :current_user, :is_logged_in?
before_action :current_user,

def current_user
  if session[:user_id].present?
    @current_user= User.find(session[:user_id])
  else
    @current_user= nil

  end
end


def is_logged_in?
session[:user_id].present?
end

def force_login
unless is_logged_in?
  redirect_to root_path
end
end

end
