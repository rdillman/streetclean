class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.string :authorname
      t.string :authoremail
      t.string :authorcomments

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
