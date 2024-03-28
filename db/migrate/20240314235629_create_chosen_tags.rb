class CreateChosenTags < ActiveRecord::Migration[7.1]
  def change
    create_table :chosen_tags do |t|
      t.string :tag_id
      t.references :user
      t.integer :order
      t.timestamps
    end
  end
end
