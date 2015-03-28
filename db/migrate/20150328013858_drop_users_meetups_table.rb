class DropUsersMeetupsTable < ActiveRecord::Migration
  def change
    drop_table :users_meetups
  end
end
