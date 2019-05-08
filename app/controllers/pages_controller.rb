class PagesController < ApplicationController

  def bettyland
    @user= @current_user
    @users= User.order("created_at DESC").limit(3)
    @newsletters= Newsletter.order("created_at desc").limit(3)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count

  end

  def welcome
    @user= @current_user
  end


end
