class CreateChosenGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :chosen_genres do |t|

      t.integer :user_id
      t.integer :setting_id
      t.string :genre_id
      t.timestamps
    end
  end
end
