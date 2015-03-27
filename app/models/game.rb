class Game < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name,
            :description,
            :min_players,
            :max_players, presence: true


  has_many :collections
  has_many :users, through: :collections
  
  has_many :mechanics
end
