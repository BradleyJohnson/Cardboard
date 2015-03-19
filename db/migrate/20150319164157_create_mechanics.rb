class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.string :type

      t.timestamps
    end
  end
end
