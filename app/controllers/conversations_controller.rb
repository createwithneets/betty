class ConversationsController < ApplicationController
  before_action :force_login

  def index
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @users = User.where.not(id: current_user.id)
    @user = @current_user
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count
  end


  def create
    @user = @current_user
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @users = User.where.not(id: current_user.id)
    
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end


  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end


end
