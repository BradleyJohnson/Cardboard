class Meetup < ActiveRecord::Base
  validates :location_string,
            :location_address,
            :meetup_notes,
            :meetup_date,
            :start_time,
            :end_time, presence: true

  belongs_to :group

  has_many :rsvps
  has_many :users, through: :rsvps

  def aggregate_collections(attendees)
    aggregate = []

    attendees.each do |user|
      user.games.each do |game|
        aggregate.push(game)
      end
    end
    aggregate
  end
end
