class CreateChosenArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :chosen_artists do |t|
      t.string :artist_id
      t.references :user
      t.integer :order
      t.timestamps
    end
  end
end
