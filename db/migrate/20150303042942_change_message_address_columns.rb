class ChangeMessageAddressColumns < ActiveRecord::Migration
  change_table :messages do |t|
    t.remove :sender_id
    t.remove :recipient_id
    t.string :sender_username
    t.string :recipient_username
  end
end
