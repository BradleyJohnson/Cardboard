class Mechanic < ActiveRecord::Base
  validates :mechanic_type, presence: true

  belongs_to :game
end
