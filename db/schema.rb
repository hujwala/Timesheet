# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150311052844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "time_sheets", force: true do |t|
    t.string   "project_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date"
    t.integer  "user_id"
    t.integer  "working_time"
  end

  add_index "time_sheets", ["date"], name: "index_time_sheets_on_date", using: :btree
  add_index "time_sheets", ["user_id"], name: "index_time_sheets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
  end

end
