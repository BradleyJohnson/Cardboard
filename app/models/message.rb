class Message < ActiveRecord::Base
  validates :title, :body, :sender_username, :recipient_username, presence: true
end
