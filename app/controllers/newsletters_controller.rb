class NewslettersController < ApplicationController
  before_action :force_login
  def index
    @newsletters = Newsletter.search(params[:search]).paginate(page: params[:page]).order("created_at DESC")
    @user= current_user
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count

  end


  def show
    @newsletter= Newsletter.find(params[:id])
    @newsletters = Newsletter.paginate(page: params[:page]).order("created_at DESC")
    @user= current_user
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count
  end

end
