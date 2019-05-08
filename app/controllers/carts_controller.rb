class CartsController < ApplicationController

  def show
    @user= current_user
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count
  end

end
