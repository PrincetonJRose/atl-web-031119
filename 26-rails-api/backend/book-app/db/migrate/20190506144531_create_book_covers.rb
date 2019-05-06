class CreateBookCovers < ActiveRecord::Migration[5.2]
  def change
    create_table :book_covers do |t|
      t.string :title
      t.string :author
      t.string :cover_url

      t.timestamps
    end
  end
end
