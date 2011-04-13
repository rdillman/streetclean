class AddTextNumberToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :text_number, :string
  end

  def self.down
    remove_column :users, :text_number
  end
end
