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

ActiveRecord::Schema.define(version: 20151102145233) do

  create_table "airlines", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "ticket_no"
    t.integer  "no_of_passengers"
    t.integer  "flight_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "cost"
    t.integer  "plane_id"
  end

  add_index "bookings", ["flight_id"], name: "index_bookings_on_flight_id"
  add_index "bookings", ["plane_id"], name: "index_bookings_on_plane_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "flights", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "departure_id"
    t.datetime "departure_date"
    t.decimal  "price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "flights", ["departure_id"], name: "index_flights_on_departure_id"
  add_index "flights", ["destination_id"], name: "index_flights_on_destination_id"

  create_table "identities", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "passengers", ["booking_id"], name: "index_passengers_on_booking_id"

  create_table "planes", force: :cascade do |t|
    t.string   "name"
    t.integer  "flight_id"
    t.integer  "airline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "planes", ["airline_id"], name: "index_planes_on_airline_id"
  add_index "planes", ["flight_id"], name: "index_planes_on_flight_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "profile_img"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
