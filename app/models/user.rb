class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :memberships
  has_many :groups, through: :memberships



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
