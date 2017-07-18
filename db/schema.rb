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

ActiveRecord::Schema.define(version: 20170717220823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source"
    t.string "destination"
    t.index ["stop_id"], name: "index_favorites_on_stop_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.time "departure_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "station_id"
    t.bigint "train_id"
    t.index ["station_id"], name: "index_stops_on_station_id"
    t.index ["train_id"], name: "index_stops_on_train_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "train_number"
    t.string "direction"
    t.string "service_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "favorites", "stops"
  add_foreign_key "favorites", "users"
  add_foreign_key "stops", "stations"
  add_foreign_key "stops", "trains"
end
