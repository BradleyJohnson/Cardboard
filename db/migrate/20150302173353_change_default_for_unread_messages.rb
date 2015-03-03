class ChangeDefaultForUnreadMessages < ActiveRecord::Migration
  def change
    change_column_default :messages, :unread, true
  end
end
