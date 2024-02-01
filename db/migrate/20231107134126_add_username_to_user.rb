class AddUsernameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :contactnumber, :integer
    add_column :users, :role, :integer, default: 0
  end
end
