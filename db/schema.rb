ActiveRecord::Schema.define(version: 2021_09_03_023710) do
  create_table "estates", force: :cascade do |t|
    t.text "name"
    t.integer "price"
    t.text "adress"
    t.integer "age"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "near_stations", force: :cascade do |t|
    t.string "line"
    t.string "station_name"
    t.integer "time_on_foot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estate_id"
    t.index ["estate_id"], name: "index_near_stations_on_estate_id"
  end
end
