class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :image_url, null: false
      t.string :name, null: false
      t.string :age
      t.string :description
      t.integer :likes, default: 1
      t.boolean :adopted, default: false
      t.timestamps
    end
  end
end
