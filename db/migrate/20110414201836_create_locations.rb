class CreateLocations < ActiveRecord::Migration
  def self.up
    drop_table :locations
    create_table :locations do |t|
      t.integer :addr
      t.integer :block_num
      t.string :streetname
      t.string :direction
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
