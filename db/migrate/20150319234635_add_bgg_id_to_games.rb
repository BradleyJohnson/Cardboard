class AddBggIdToGames < ActiveRecord::Migration
  def change
    add_column(:games, :bgg_id, :integer)
  end
end
