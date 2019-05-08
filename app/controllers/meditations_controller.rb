class MeditationsController < ApplicationController

def index
    @meditations = Meditation.search(params[:search]).paginate(page: params[:page]).order("created_at DESC")
    @user = @current_user
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @users = User.where.not(id: current_user.id)
    @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count
end

end
