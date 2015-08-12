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

ActiveRecord::Schema.define(version: 20150812164747) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_uid"
    t.string   "image_name"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "court_ammount"
    t.string   "phone_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "courts", force: :cascade do |t|
    t.integer  "court_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "city_id"
  end

  add_index "courts", ["city_id"], name: "index_courts_on_city_id"

  create_table "micro_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "court_id"
    t.time     "from"
    t.time     "to"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "reservations", ["court_id"], name: "index_reservations_on_court_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "tournaments", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "from"
    t.date     "to"
    t.string   "contact"
    t.string   "author"
    t.string   "surface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_uid"
    t.string   "city"
    t.string   "address"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "access_token"
  end

end
