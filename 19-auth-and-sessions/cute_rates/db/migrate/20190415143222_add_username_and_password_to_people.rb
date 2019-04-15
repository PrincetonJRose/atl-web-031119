class AddUsernameAndPasswordToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :username, :string
    add_column :people, :password, :string
  end
end
