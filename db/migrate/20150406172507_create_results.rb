class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :game_id
      t.boolean :result
      t.integer :user_id
      t.integer :meetup_id

      t.timestamps
    end
  end
end
