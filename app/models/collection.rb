class Collection < ActiveRecord::Base
  validates :game_id, :uniqueness => {:scope => :user_id, :message => "You already have this game in your collection!"}
  validates :game_id,
            :user_id, presence: true

  belongs_to :game
  belongs_to :user
end
