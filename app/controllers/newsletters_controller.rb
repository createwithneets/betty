class NewslettersController < ApplicationController
  before_action :force_login
  def index
    @newsletters = Newsletter.search(params[:search]).paginate(page: params[:page])
    @user= current_user

  end


  def show
    @newsletter= Newsletter.find(params[:id])
    @newsletters = Newsletter.paginate(page: params[:page])
    @user= current_user
  end

end
