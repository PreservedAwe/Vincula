class CreateChosenArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :chosen_artists do |t|

      t.references :user_id
      t.string :artist_id
      t.timestamps
    end
  end
end
