class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps
    end
  end
end
