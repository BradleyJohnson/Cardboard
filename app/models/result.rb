class Result < ActiveRecord::Base
  validates :meetup_id,
            :user_id,
            :game_id,
            presence: true

  validates :result,
            :inclusion => [true, false] 

  belongs_to :user
  belongs_to :meetup
  belongs_to :game
end
