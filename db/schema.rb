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

ActiveRecord::Schema.define(version: 20150420190938) do

  create_table "campuses", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "abbreviation",       null: false
    t.string   "institution_type",   null: false
    t.integer  "director_id"
    t.string   "website_url"
    t.string   "address_1",          null: false
    t.string   "address_2"
    t.string   "city",               null: false
    t.string   "state",              null: false
    t.string   "zip",                null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "registration_open_datetime"
    t.datetime "registration_close_datetime"
    t.integer  "max_registrants"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string   "address"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
