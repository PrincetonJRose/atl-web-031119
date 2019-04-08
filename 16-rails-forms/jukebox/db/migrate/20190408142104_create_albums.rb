class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.integer :year
      t.integer :rating

      t.timestamps
    end
  end
end
