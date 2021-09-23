# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_23_090337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "prefix"
    t.string "suffix"
    t.integer "code_length"
    t.integer "code_count"
    t.string "charset"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "coupon_code"
    t.string "coupon_type"
    t.float "value"
    t.datetime "published_at"
    t.datetime "valid_until"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_coupons_on_campaign_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "source_uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "metadata", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "order_id", null: false
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_metadata", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "metadata_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["metadata_id"], name: "index_order_metadata_on_metadata_id"
    t.index ["order_id"], name: "index_order_metadata_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.bigint "customer_id", null: false
    t.float "amount"
    t.string "source_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "redemptions", force: :cascade do |t|
    t.bigint "coupon_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "amount"
    t.string "status"
    t.jsonb "metadata"
    t.bigint "order_id"
    t.index ["coupon_id"], name: "index_redemptions_on_coupon_id"
    t.index ["customer_id"], name: "index_redemptions_on_customer_id"
    t.index ["order_id"], name: "index_redemptions_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "validation_rules", force: :cascade do |t|
    t.float "valid_amount"
    t.integer "limitation_count"
    t.jsonb "rules"
    t.bigint "coupon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coupon_id"], name: "index_validation_rules_on_coupon_id"
  end

  add_foreign_key "coupons", "campaigns"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_metadata", "metadata", column: "metadata_id"
  add_foreign_key "order_metadata", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "redemptions", "coupons"
  add_foreign_key "redemptions", "customers"
  add_foreign_key "redemptions", "orders"
  add_foreign_key "validation_rules", "coupons"
end
