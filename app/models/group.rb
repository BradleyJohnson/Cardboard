class Group < ActiveRecord::Base
  validates :location, :description, presence: true
  validates :name, uniqueness: true, presence: true

  has_many :memberships
  has_many :users, through: :memberships

  has_many :meetups

  def admin
    User.joins(:memberships).where(memberships: { group_id: id, is_admin: true})
  end

  def founder
    User.joins(:memberships).where(memberships: { group_id: id, is_founder: true})
  end
end
