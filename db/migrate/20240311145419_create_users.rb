class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :username
      t.string :picture
      t.string :mainVideo
      t.string :location
      t.string :genre
      t.string :title
      t.string :bands

      
      t.timestamps
    end
  end
end
