# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110323234316) do

  create_table "streets", :force => true do |t|
    t.string  "streetname"
    t.string  "rl"
    t.integer "bottoml"
    t.integer "topl"
    t.integer "bottomr"
    t.integer "topr"
    t.string  "day"
    t.string  "start"
    t.string  "finish"
    t.boolean "wk1"
    t.boolean "wk2"
    t.boolean "wk3"
    t.boolean "wk4"
    t.boolean "wk5"
    t.boolean "holiday"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
