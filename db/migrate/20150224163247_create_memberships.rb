class CreateMemberships < ActiveRecord::Migration
  def change

    create_table :memberships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.timestamps
    end

  end
end
