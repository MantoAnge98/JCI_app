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

ActiveRecord::Schema.define(version: 2021_01_21_124149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.date "date_payment"
    t.text "note"
    t.integer "pay_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "year_promotion"
    t.string "image_promotion", default: "f"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "amount_due"
    t.string "devise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "avatar", default: "f"
    t.boolean "admin", default: false
    t.string "name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.date "added_since", null: false
    t.bigint "telephone", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.bigint "payment_id"
    t.bigint "setting_id"
    t.bigint "promotion_id"
    t.date "birthday"
    t.string "profession"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["payment_id"], name: "index_users_on_payment_id"
    t.index ["promotion_id"], name: "index_users_on_promotion_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["setting_id"], name: "index_users_on_setting_id"
  end

  add_foreign_key "users", "groups"
  add_foreign_key "users", "payments"
  add_foreign_key "users", "promotions"
  add_foreign_key "users", "settings"
end
