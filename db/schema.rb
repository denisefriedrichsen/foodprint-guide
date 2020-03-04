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

ActiveRecord::Schema.define(version: 2020_03_03_173209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favourite_producers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_id"], name: "index_favourite_producers_on_producer_id"
    t.index ["user_id"], name: "index_favourite_producers_on_user_id"
  end

  create_table "favourite_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favourite_products_on_product_id"
    t.index ["user_id"], name: "index_favourite_products_on_user_id"
  end

  create_table "offerings", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_id"], name: "index_offerings_on_producer_id"
    t.index ["product_id"], name: "index_offerings_on_product_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "address"
    t.bigint "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_id"], name: "index_posts_on_producer_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "company_name"
    t.string "owner_name"
    t.string "address"
    t.text "description"
    t.integer "phone_number"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "season_start"
    t.integer "season_end"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address"
    t.string "photo"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favourite_producers", "producers"
  add_foreign_key "favourite_producers", "users"
  add_foreign_key "favourite_products", "products"
  add_foreign_key "favourite_products", "users"
  add_foreign_key "offerings", "producers"
  add_foreign_key "offerings", "products"
  add_foreign_key "posts", "producers"
end
