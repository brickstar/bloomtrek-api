ActiveRecord::Schema.define(version: 2018_10_23_215052) do

  enable_extension "plpgsql"

  create_table "flowers", force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.string "flower_img_url"
    t.string "description"
    t.date "bloom_start"
    t.date "bloom_end"
  end

  create_table "park_flowers", force: :cascade do |t|
    t.bigint "parks_id"
    t.bigint "flowers_id"
    t.index ["flowers_id"], name: "index_park_flowers_on_flowers_id"
    t.index ["parks_id"], name: "index_park_flowers_on_parks_id"
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

  add_foreign_key "park_flowers", "flowers", column: "flowers_id"
  add_foreign_key "park_flowers", "parks", column: "parks_id"
  add_foreign_key "trails", "parks", column: "parks_id"
end
