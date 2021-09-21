ActiveRecord::Schema.define(version: 2021_09_17_074527) do
  enable_extension "plpgsql"

  create_table "coupons", force: :cascade do |t|
    t.string "coupon_code"
    t.string "coupon_type"
    t.float "value"
    t.datetime "published_at"
    t.datetime "valid_until"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
