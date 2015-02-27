class Group < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :memberships
  has_many :users, through: :memberships
end
