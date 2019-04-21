class PagesController < ApplicationController

  def bettyland
    @user= @current_user
    @newsletters= Newsletter.order("created_at desc").limit(3)
  end

  def welcome
    @user= @current_user
  end


end
