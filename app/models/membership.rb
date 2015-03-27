class Membership < ActiveRecord::Base
  validates :group_id, :uniqueness => {:scope => :user_id, :message => "You're already a member of this group!"}
  validates :group_id,
            :user_id, presence: true

  belongs_to :user
  belongs_to :group
end
