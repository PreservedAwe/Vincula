class CreateChosenTags < ActiveRecord::Migration[7.1]
  def change
    create_table :chosen_tags do |t|

      t.integer :user_id
      t.integer :setting_id
      t.string :tag_name
      t.timestamps
    end
  end
end
