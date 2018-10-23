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

ActiveRecord::Schema.define(version: 2018_10_23_214745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flowers", force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.string "flower_img_url"
    t.string "description"
    t.date "bloom_start"
    t.date "bloom_end"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "trails", force: :cascade do |t|
    t.string "difficulty"
    t.float "length"
    t.integer "status"
    t.string "trail_img_url"
    t.string "trail_url"
    t.bigint "parks_id"
    t.index ["parks_id"], name: "index_trails_on_parks_id"
  end

  add_foreign_key "trails", "parks", column: "parks_id"
end
