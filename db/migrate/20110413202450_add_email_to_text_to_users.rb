class AddEmailToTextToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email_to_text, :string
  end

  def self.down
    remove_column :users, :email_to_text
  end
end
