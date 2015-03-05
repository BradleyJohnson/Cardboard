class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.where(recipient_username: current_user.username, unread: true)
    UpdateMessagesService.new(@messages).update
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to messages_path
  end


  private

  def message_params
    params.require(:message).permit(:title, :body, :sender_username, :recipient_username)
  end
end
