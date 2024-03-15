class CreateChosenTags < ActiveRecord::Migration[7.1]
  def change
    create_table :chosen_tags do |t|

      t.references :user_id
      t.string :tag_name
      t.timestamps
    end
  end
end
