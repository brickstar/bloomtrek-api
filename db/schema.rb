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

ActiveRecord::Schema.define(version: 2018_10_26_010309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flowers", force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.string "flower_img_url"
    t.string "description"
    t.date "bloom_start"
    t.date "bloom_end"
    t.string "name"
    t.string "habitat"
  end

  create_table "park_flowers", force: :cascade do |t|
    t.bigint "park_id"
    t.bigint "flower_id"
    t.index ["flower_id"], name: "index_park_flowers_on_flower_id"
    t.index ["park_id"], name: "index_park_flowers_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.integer "uid"
    t.string "difficulty"
    t.float "length"
    t.string "status"
    t.string "trail_img_url"
    t.string "trail_url"
    t.string "summary"
    t.float "latitude"
    t.float "longitude"
    t.bigint "park_id"
    t.index ["park_id"], name: "index_trails_on_park_id"
  end

  add_foreign_key "park_flowers", "flowers"
  add_foreign_key "park_flowers", "parks"
  add_foreign_key "trails", "parks"
end
