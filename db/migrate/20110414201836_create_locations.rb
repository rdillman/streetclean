class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :addr
      t.integer :block_num
      t.string :streetname
      t.string :direction
      t.time :start
      t.time :stop
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
