class AddAdminToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :is_admin, :boolean, default: false
  end
end
