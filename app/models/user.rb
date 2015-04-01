class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true


  has_many :memberships
  has_many :groups, through: :memberships

  has_many :collections
  has_many :games, through: :collections

  has_many :rsvps
  has_many :meetups, through: :rsvps

  has_many :comments, as: :commentable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
