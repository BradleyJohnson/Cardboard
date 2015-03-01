class AddAuthFieldsToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :is_founder, :boolean, default: false
  end
end
