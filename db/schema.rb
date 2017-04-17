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

ActiveRecord::Schema.define(version: 20170417011800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "image_path"
  end

  create_table "experience_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_experience_categories_on_category_id", using: :btree
    t.index ["experience_id"], name: "index_experience_categories_on_experience_id", using: :btree
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "cost"
    t.string   "city"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_path"
    t.string   "status",      default: "active"
  end

  create_table "experiences_orders", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "cost"
    t.integer  "quantity"
    t.integer  "subtotal"
    t.integer  "order_id"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experience_id"], name: "index_experiences_orders_on_experience_id", using: :btree
    t.index ["order_id"], name: "index_experiences_orders_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "total_price"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.integer "role",            default: 0
  end

  add_foreign_key "experience_categories", "categories"
  add_foreign_key "experience_categories", "experiences"
  add_foreign_key "experiences_orders", "experiences"
  add_foreign_key "experiences_orders", "orders"
  add_foreign_key "orders", "users"
end
