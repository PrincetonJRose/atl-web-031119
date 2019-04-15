class AddPersonIdToPets < ActiveRecord::Migration[5.2]
  def up
    rename_table :cute_pets, :pets
    add_column :pets, :person_id, :integer
  end

  def down
    remove_column :pets, :person_id
    rename_table :pets, :cute_pets
  end
end
