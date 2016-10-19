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

ActiveRecord::Schema.define(version: 20161010073130) do

  create_table "charities", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "total_amount"
    t.string   "iban"
    t.string   "registration_number"
    t.string   "country"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_charities_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "sender_id"
    t.string   "receiver_id"
    t.string   "message_body"
    t.boolean  "status",           default: false
    t.datetime "appointment_date"
    t.integer  "user_id"
    t.index ["appointment_date"], name: "index_messages_on_appointment_date"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text     "body"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_responses_on_message_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "schedule"
    t.integer  "response_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["response_id"], name: "index_schedules_on_response_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "headline"
    t.string   "description"
    t.string   "image"
    t.string   "phone"
    t.string   "industry"
    t.string   "slug"
    t.decimal  "total_donated",          default: "0.0"
    t.decimal  "donation_amount",        default: "5.0"
    t.integer  "charity_id"
    t.index ["charity_id"], name: "index_users_on_charity_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

end
