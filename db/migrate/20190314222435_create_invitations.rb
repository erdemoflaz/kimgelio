class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :status
    end
  end
end
