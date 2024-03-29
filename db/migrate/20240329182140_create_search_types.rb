class CreateSearchTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :search_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
