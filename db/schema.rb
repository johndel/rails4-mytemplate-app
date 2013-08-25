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

ActiveRecord::Schema.define(version: 20130824114337) do

  create_table "acts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artist_occasions", force: true do |t|
    t.integer  "artist_id"
    t.integer  "occasion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_occasions", ["artist_id"], name: "index_artist_occasions_on_artist_id", using: :btree
  add_index "artist_occasions", ["occasion_id"], name: "index_artist_occasions_on_occasion_id", using: :btree

  create_table "artists", force: true do |t|
    t.string   "real_name"
    t.string   "nickname"
    t.date     "birth_date"
    t.text     "biography"
    t.integer  "country_id"
    t.text     "studies"
    t.integer  "act_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["act_id"], name: "index_artists_on_act_id", using: :btree
  add_index "artists", ["country_id"], name: "index_artists_on_country_id", using: :btree

  create_table "business_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: true do |t|
    t.string   "contact_person"
    t.string   "name"
    t.string   "business_type_id"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "businesses", ["business_type_id"], name: "index_businesses_on_business_type_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "place"
    t.text     "comments"
    t.date     "date"
    t.time     "time"
    t.integer  "business_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["artist_id"], name: "index_events_on_artist_id", using: :btree
  add_index "events", ["business_id"], name: "index_events_on_business_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occasions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occasions_artists", id: false, force: true do |t|
    t.integer "artist_id"
    t.integer "occasion_id"
  end

  add_index "occasions_artists", ["artist_id"], name: "index_occasions_artists_on_artist_id", using: :btree
  add_index "occasions_artists", ["occasion_id"], name: "index_occasions_artists_on_occasion_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.string   "address"
    t.string   "city"
    t.integer  "country_id"
    t.string   "zip"
    t.string   "telephone"
    t.string   "mobile_phone"
    t.integer  "profile_id"
    t.string   "profile_type"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["country_id"], name: "index_users_on_country_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.integer  "artist_id"
    t.string   "youtube"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["artist_id"], name: "index_videos_on_artist_id", using: :btree

end
