class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true


  has_many :memberships
  has_many :groups, through: :memberships

  has_many :collections
  has_many :games, through: :collections

  has_and_belongs_to_many :meetups
  # has_and_belongs_to_many :meetups,  join_table: :users_meetups

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
