class AddPasswordDigestToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :password_digest, :string
    remove_column :people, :password, :string
  end
end
