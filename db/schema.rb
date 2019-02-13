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

ActiveRecord::Schema.define(version: 2019_02_13_023756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "codelangs", force: :cascade do |t|
    t.string "lang"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_codelangs_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "midpoint_id"
    t.text "remark"
    t.date "event_date"
    t.time "event_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["midpoint_id"], name: "index_events_on_midpoint_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "hotel_name"
    t.string "star"
    t.integer "price"
    t.string "city"
    t.text "address"
    t.string "link"
    t.string "longtitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invites_on_event_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "midpoints", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.text "description"
    t.float "longtitude"
    t.float "latitude"
    t.text "poi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "category"
    t.text "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "address"
    t.string "longtitude"
    t.string "latitude"
    t.string "poi"
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "lang"
    t.text "git_link"
    t.text "description"
    t.text "avatar"
    t.date "joined"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
end
