class PagesController < ApplicationController

  def bettyland
    @user= @current_user
    @users= User.order("created_at DESC").limit(3)
    @newsletters= Newsletter.order("created_at desc").limit(3)
  end

  def welcome
    @user= @current_user
  end


end
