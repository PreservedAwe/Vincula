class CreateChosenArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :chosen_artists do |t|

      t.integer :user_id
      t.integer :setting_id
      t.string :artist_id
      t.integer :order
      t.timestamps
    end
  end
end
