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

ActiveRecord::Schema.define(:version => 20110426183814) do

  create_table "alerts", :force => true do |t|
    t.string   "location"
    t.string   "clean_time"
    t.string   "message"
    t.string   "send_time"
    t.integer  "user_id"
    t.integer  "ct_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", :force => true do |t|
    t.string  "side"
    t.integer "top"
    t.integer "bottom"
    t.string  "dir"
    t.integer "ct_id"
    t.integer "nhood_id"
    t.integer "street_id"
  end

  create_table "cts", :force => true do |t|
    t.string "wday"
    t.string "start"
    t.string "stop"
    t.string "boolyuns"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "authorname"
    t.string   "authoremail"
    t.string   "authorcomments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "addr"
    t.integer  "block_num"
    t.string   "streetname"
    t.string   "direction"
    t.string   "start"
    t.string   "stop"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nhoods", :force => true do |t|
    t.string "nhood"
  end

  create_table "streets", :force => true do |t|
    t.string "streetname"
    t.string "suffix"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "phone_number"
    t.string   "carrier"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
