class CreateChosenGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :chosen_genres do |t|
      t.string :genre_id
      t.integer :order
      t.references :user
      t.timestamps
    end
  end
end
