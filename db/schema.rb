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

ActiveRecord::Schema.define(version: 20151022134916) do

  create_table "access_controls", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "access_controls", ["role_id"], name: "index_access_controls_on_role_id"
  add_index "access_controls", ["user_id"], name: "index_access_controls_on_user_id"

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
    t.string   "slug",               null: false
  end

  add_index "campuses", ["abbreviation"], name: "campuses_abbreviation_index", unique: true
  add_index "campuses", ["name"], name: "campuses_name_index", unique: true
  add_index "campuses", ["slug"], name: "campuses_slug_index", unique: true

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug",        null: false
  end

  add_index "communities", ["slug"], name: "index_communities_on_slug", unique: true

  create_table "events", force: :cascade do |t|
    t.string   "name",                                      null: false
    t.datetime "registration_open_datetime",                null: false
    t.datetime "registration_close_datetime",               null: false
    t.integer  "max_registrants",             default: 100
    t.datetime "start_datetime",                            null: false
    t.datetime "end_datetime",                              null: false
    t.string   "address",                                   null: false
    t.string   "address_2"
    t.string   "city",                                      null: false
    t.string   "state",                                     null: false
    t.string   "zip_code",                                  null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "slug",                                      null: false
  end

  add_index "events", ["name"], name: "index_events_on_name", unique: true
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true

  create_table "module_author_associations", id: false, force: :cascade do |t|
    t.integer "author_id"
    t.integer "module_id"
  end

  add_index "module_author_associations", ["author_id"], name: "index_module_author_associations_on_author_id"
  add_index "module_author_associations", ["module_id"], name: "index_module_author_associations_on_module_id"

  create_table "module_faculty_associations", id: false, force: :cascade do |t|
    t.integer "faculty_id"
    t.integer "module_id"
  end

  add_index "module_faculty_associations", ["faculty_id"], name: "index_module_faculty_associations_on_faculty_id"
  add_index "module_faculty_associations", ["module_id"], name: "index_module_faculty_associations_on_module_id"

  create_table "module_section_associations", id: false, force: :cascade do |t|
    t.integer "section_id"
    t.integer "module_id"
  end

  add_index "module_section_associations", ["module_id"], name: "index_module_section_associations_on_module_id"
  add_index "module_section_associations", ["section_id"], name: "index_module_section_associations_on_section_id"

  create_table "news_articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "action"
    t.string   "subject"
    t.string   "conditions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "udl_module_sections", force: :cascade do |t|
    t.string  "title"
    t.text    "content"
    t.string  "parent"
    t.integer "position"
  end

  create_table "udl_modules", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "sub_heading"
    t.string   "udl_principles"
    t.text     "description"
    t.boolean  "released"
    t.date     "release_date"
    t.date     "latest_revision_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             null: false
    t.string   "last_name",              null: false
    t.string   "email",                  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "password_digest",        null: false
    t.string   "auth_token"
    t.string   "activation_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
