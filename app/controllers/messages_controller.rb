class MessagesController < ApplicationController

  def index
    @message = Message.new
    @recipient_username = current_user.username
    @messages = Message.where(recipient_username: @recipient_username, unread: true)
  end

  # def new
  #   @message = Message.new
  # end

  def create
    puts "IN THE MESSAGES CREATE METHOD"
    @message = Message.new(message_params)
    @message.save
    redirect_to messages_path
  end


  private

  def message_params
    params.require(:message).permit(:title, :body, :sender_username, :recipient_username)
  end
end
