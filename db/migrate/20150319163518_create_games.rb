class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :thumbnail
      t.integer :year_published
      t.string :game_designer
      t.integer :min_players
      t.integer :max_players

      t.timestamps
    end
  end
end
