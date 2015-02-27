class Membership < ActiveRecord::Base
  validates :group_id, :uniqueness => {:scope => :user_id}
  validates :group_id, :user_id, presence: true
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :group
end
