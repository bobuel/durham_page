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

ActiveRecord::Schema.define(version: 20140418130217) do

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planters", force: true do |t|
    t.string   "name"
    t.integer  "length_ft"
    t.integer  "length_inch"
    t.integer  "width_ft"
    t.integer  "width_inch"
    t.integer  "height_ft"
    t.integer  "height_inch"
    t.integer  "depth_ft"
    t.integer  "depth_inch"
    t.integer  "area_ft"
    t.integer  "area_inch"
    t.integer  "volume_ft"
    t.integer  "volume_inch"
    t.integer  "price_cents"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plants", force: true do |t|
    t.string   "name"
    t.integer  "length_ft"
    t.integer  "length_inch"
    t.integer  "width_ft"
    t.integer  "width_inch"
    t.integer  "height_ft"
    t.integer  "height_inch"
    t.integer  "area_ft"
    t.integer  "area_inch"
    t.integer  "volume_ft"
    t.integer  "volume_inch"
    t.integer  "price_cents"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_assignments", force: true do |t|
    t.integer  "request_plant_id"
    t.integer  "request_id"
    t.integer  "quantity"
    t.integer  "price_cents_when_requested"
    t.integer  "price_cents_estimate"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "space_id"
    t.string   "description"
    t.boolean  "submitted"
    t.boolean  "viewed"
    t.boolean  "designed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "user_id"
    t.datetime "log_in_time"
    t.datetime "log_out_time"
    t.integer  "duration_seconds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spaces", force: true do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.string   "name"
    t.integer  "length_ft"
    t.integer  "length_inch"
    t.integer  "width_ft"
    t.integer  "width_inch"
    t.integer  "height_ft"
    t.integer  "height_inch"
    t.boolean  "is_rooftop"
    t.boolean  "is_ground"
    t.integer  "floor"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_assignments", force: true do |t|
    t.integer  "tag_id"
    t.integer  "plant_id"
    t.integer  "planter_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_assignments", ["tag_id", "plant_id", "planter_id"], name: "index_tag_assignments_on_tag_id_and_plant_id_and_planter_id", unique: true

  create_table "tags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "user_email"
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.boolean  "is_designer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
