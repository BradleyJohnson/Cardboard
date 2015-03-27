class AddFieldsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :description, :text
    add_column :groups, :location, :string
  end
end
