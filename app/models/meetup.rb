class Meetup < ActiveRecord::Base
  validates :location_string,
            :location_address,
            :meetup_notes,
            :meetup_date,
            :start_time,
            :end_time, presence: true


  belongs_to :group

  has_and_belongs_to_many :users
  # has_and_belongs_to_many :users,  join_table: :users_meetups
end
