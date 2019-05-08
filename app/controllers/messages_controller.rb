class MessagesController < ApplicationController

  before_action :force_login
  before_action do
      @conversation = Conversation.find(params[:conversation_id])
    end

    def index

      @user = @current_user
      @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
      @users = User.where.not(id: current_user.id)
      @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count

      @messages = @conversation.messages

      @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)

      @message = @conversation.messages.new
    end

    def create

      @user = @current_user
      @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
      @users = User.where.not(id: current_user.id)
      @unread_messages = Message.where(conversation: @conversations).where.not(user: current_user).where(read: false).count

      @message = @conversation.messages.new(message_params)
      @message.user = current_user

      if @message.save
        redirect_to conversation_messages_path(@conversation)
      end
    end

    private
      def message_params
        params.require(:message).permit(:body, :user_id)
      end


end
