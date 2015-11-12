ActiveRecord::Schema.define(version: 20151107102501) do

  create_table "airlines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookers", force: :cascade do |t|
    t.string   "booking_id"
    t.string   "express_token"
    t.string   "express_payer_id"
    t.string   "ip"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "bookers", ["booking_id"], name: "index_bookers_on_booking_id"

  create_table "bookings", force: :cascade do |t|
    t.integer  "ticket_no"
    t.integer  "no_of_passengers"
    t.integer  "flight_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "cost"
    t.datetime "booked_at"
    t.boolean  "paid_booking"
  end

  add_index "bookings", ["flight_id"], name: "index_bookings_on_flight_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "flights", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "departure_id"
    t.datetime "departure_date"
    t.integer  "airline_id"
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
