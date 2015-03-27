class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :location_string
      t.string :location_address
      t.text :meetup_notes
      t.integer :rsvp_count
      t.date :meetup_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
