class CreateCts < ActiveRecord::Migration
  def self.up
    create_table :cts do |t|
      t.string :wday
      t.string :start
      t.string :stop
      t.string :boolyuns
    end
  end

  def self.down
    drop_table :cts
  end
end
