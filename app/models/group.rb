class Group < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true

  has_and_belongs_to_many :users
end
