class ChangeMechanics < ActiveRecord::Migration
  def change
    add_column :mechanics, :game_id, :integer
  end
end
