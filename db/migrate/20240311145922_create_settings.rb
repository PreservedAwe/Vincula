class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|

      t.integer :max_distance
      t.references :user
      t.boolean :is_enabled
      
      t.timestamps
    end
  end
end
