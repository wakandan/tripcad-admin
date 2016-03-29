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

ActiveRecord::Schema.define(version: 20160329151424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "note"
    t.integer  "plan_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "duration"
    t.string   "google_place_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "transportation_cd"
    t.string   "location_photo"
    t.decimal  "transportation_cost",      default: 0.0, null: false
    t.decimal  "cost",                     default: 0.0, null: false
    t.string   "google_formatted_address"
    t.string   "google_location_name"
    t.string   "google_location_schedule"
    t.string   "google_location_phone"
    t.string   "activity_type"
  end

  add_index "activities", ["plan_id"], name: "index_activities_on_plan_id", using: :btree

  create_table "best_times", force: :cascade do |t|
    t.integer  "destination_id"
    t.datetime "best_time"
    t.datetime "best_date_from"
    t.datetime "best_date_to"
    t.text     "description"
  end

  add_index "best_times", ["destination_id"], name: "index_best_times_on_destination_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "long_code"
    t.string   "currency_code"
    t.string   "currency_name"
  end

  add_index "countries", ["code"], name: "index_countries_on_code", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_url"
  end

  create_table "destinations_themes", id: false, force: :cascade do |t|
    t.integer "theme_id",       null: false
    t.integer "destination_id", null: false
  end

  create_table "distances", force: :cascade do |t|
    t.integer "destination_from_id", null: false
    t.integer "destination_to_id",   null: false
    t.integer "min_duration"
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "plan_id"
  end

  add_index "foods", ["name"], name: "index_foods_on_name", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",               null: false
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "image_url"
    t.string   "google_location_id"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "activity_theme_cd"
    t.string   "address"
    t.string   "directions"
    t.string   "phone"
    t.string   "url"
    t.string   "hours"
    t.string   "email"
    t.string   "title"
    t.string   "location_type"
    t.integer  "country_id"
    t.integer  "destination_id"
  end

  add_index "locations", ["country_id"], name: "index_locations_on_country_id", using: :btree
  add_index "locations", ["destination_id"], name: "index_locations_on_destination_id", using: :btree

  create_table "locations_themes", id: false, force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "theme_id",    null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "cost",        precision: 10, scale: 2
    t.text     "description"
    t.text     "note"
    t.text     "gears"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
    t.string   "image_url"
  end

  add_index "plans", ["user_id"], name: "index_plans_on_user_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches_themes", id: false, force: :cascade do |t|
    t.integer "search_id", null: false
    t.integer "theme_id",  null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "confirmed_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "plans"
  add_foreign_key "best_times", "destinations"
  add_foreign_key "identities", "users"
  add_foreign_key "locations", "countries"
  add_foreign_key "locations", "destinations"
  add_foreign_key "plans", "users"
end
