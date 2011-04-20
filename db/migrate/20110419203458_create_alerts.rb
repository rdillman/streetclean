class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table    :alerts do |t|
      t.string      :location
      t.string      :clean_time 
      t.string      :message
      t.integer     :send_time
      t.references  :user
      t.references  :ct

      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
