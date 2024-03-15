class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|

      t.references :sender
      t.references :receiver
      t.timestamps
    end
  end
end
