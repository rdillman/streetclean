class CreateStreets < ActiveRecord::Migration
  def self.up
    create_table :streets do |t|
      t.string :streetname
      t.string :suffix
    end
  end

  def self.down
    drop_table :streets
  end
end
