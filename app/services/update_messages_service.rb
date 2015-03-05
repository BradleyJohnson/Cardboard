class UpdateMessagesService
  def initialize(messages)
    @message_array = messages
  end

  def update
    @message_array.each do |msg|
      msg.update(unread: false)
    end
  end

end
