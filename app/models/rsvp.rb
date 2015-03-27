class Rsvp < ActiveRecord::Base
  validates :user_id, :uniqueness => {:scope => :meetup_id, :message => "You're already a member of this group!"}
  validates :meetup_id,
            :user_id, presence: true

  belongs_to :user
  belongs_to :meetup
end
