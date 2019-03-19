class PagesController < ApplicationController

  def bettyland
    @user= @current_user
  end

  def welcome
    @user= @current_user
  end 


end
