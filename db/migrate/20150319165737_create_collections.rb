class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.belongs_to :game, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
