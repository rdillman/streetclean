class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.string :side
      t.integer :top
      t.integer :bottom
      t.string :dir
      t.references :ct
      t.references :nhood
      t.references :street
    end
  end

  def self.down
    drop_table :blocks
  end
end
