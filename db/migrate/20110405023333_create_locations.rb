class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :addr
      t.string :name
      t.string :start
      t.string :stop
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
