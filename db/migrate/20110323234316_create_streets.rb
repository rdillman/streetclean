class CreateStreets < ActiveRecord::Migration
  def self.up
    create_table :streets do |t|
      t.string :streetname
      t.string :rl
      t.integer :bottoml
      t.integer :topl
      t.integer :bottomr
      t.integer :topr
      t.string :day
      t.time :start
      t.time :finish
      t.boolean :wk1
      t.boolean :wk2
      t.boolean :wk3
      t.boolean :wk4
      t.boolean :wk5
      t.boolean :holiday
    end
  end

  def self.down
    drop_table :streets
  end
end
