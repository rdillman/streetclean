class AddPhoneNumberToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_number, :string
    add_column :users, :phone_carrier, :string
  end

  def self.down
    remove_column :users, :phone_carrier
    remove_column :users, :phone_number
  end
end
