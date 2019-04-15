class CreateCutePets < ActiveRecord::Migration[5.2]
  def change
    create_table :cute_pets do |t|
      t.string :name
      t.string :image
      t.integer :likes

      t.timestamps
    end
  end
end
