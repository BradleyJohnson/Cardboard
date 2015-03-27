class AddForeignKeyToMeetups < ActiveRecord::Migration
  def change
    add_column(:meetups, :group_id, :integer)
  end
end
