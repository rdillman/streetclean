class AddUserNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :phone_number, :phone_carrier, :string
  end

  def self.down
    remove_column :users, :username
  end
end
