# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_13_172201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.bigint "customer_id", null: false
    t.bigint "barber_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barber_id"], name: "index_appointments_on_barber_id"
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
  end

  create_table "barber_shops", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "barbers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "if_available"
    t.boolean "accept_cash"
    t.boolean "accept_card"
    t.bigint "cell"
    t.bigint "barber_shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "specialty"
    t.index ["barber_shop_id"], name: "index_barbers_on_barber_shop_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "favorite_barber"
    t.string "location"
    t.string "email"
    t.bigint "cell"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "services", force: :cascade do |t|
    t.string "hair"
    t.string "shape_up"
    t.string "facial"
    t.string "facial_hair"
    t.string "extra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shop_services", force: :cascade do |t|
    t.integer "price"
    t.bigint "barber_shop_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barber_shop_id"], name: "index_shop_services_on_barber_shop_id"
    t.index ["service_id"], name: "index_shop_services_on_service_id"
  end

  add_foreign_key "appointments", "barbers"
  add_foreign_key "appointments", "customers"
  add_foreign_key "barbers", "barber_shops"
  add_foreign_key "shop_services", "barber_shops"
  add_foreign_key "shop_services", "services"
end
