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

ActiveRecord::Schema.define(version: 20170317144451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_controls", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], name: "index_access_controls_on_role_id", using: :btree
    t.index ["user_id"], name: "index_access_controls_on_user_id", using: :btree
  end

  create_table "administrator_unit_associations", force: :cascade do |t|
    t.integer "institutional_administrator_id"
    t.integer "institutional_unit_id"
    t.boolean "current_chair",                  default: false
    t.boolean "current_dean"
    t.index ["institutional_administrator_id"], name: "index_admin_unit_associations_on_administrator_id", using: :btree
    t.index ["institutional_unit_id"], name: "index_admin_unit_associations_on_unit_id", using: :btree
  end

  create_table "assessment_answer_choices", force: :cascade do |t|
    t.string   "text"
    t.string   "explanation"
    t.integer  "position"
    t.integer  "assessment_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assessment_question_id"], name: "index_assessment_answer_choices_on_assessment_question_id", using: :btree
  end

  create_table "assessment_questions", force: :cascade do |t|
    t.string   "question"
    t.string   "explanation"
    t.integer  "udl_module_section_id"
    t.boolean  "ordered"
    t.integer  "udl_module_id"
    t.integer  "correct_answer_choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["correct_answer_choice_id"], name: "index_assessment_questions_on_correct_answer_choice_id", using: :btree
    t.index ["udl_module_id"], name: "index_assessment_questions_on_udl_module_id", using: :btree
    t.index ["udl_module_section_id"], name: "index_assessment_questions_on_udl_module_section_id", using: :btree
  end

  create_table "campus_departments", force: :cascade do |t|
    t.string  "name"
    t.integer "campus_id"
    t.string  "chair_first_name"
    t.string  "chair_last_name"
    t.string  "chair_email"
    t.string  "timestamps"
    t.index ["campus_id"], name: "index_campus_departments_on_campus_id", using: :btree
  end

  create_table "campus_units", force: :cascade do |t|
    t.string   "name"
    t.integer  "campus_id"
    t.string   "director_first_name"
    t.string   "director_last_name"
    t.string   "director_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["campus_id"], name: "index_campus_units_on_campus_id", using: :btree
  end

  create_table "campuses", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "abbreviation",       null: false
    t.string   "institution_type",   null: false
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
    t.integer  "director_id"
    t.index ["abbreviation"], name: "campuses_abbreviation_index", unique: true, using: :btree
    t.index ["director_id"], name: "index_campuses_on_director_id", using: :btree
    t.index ["name"], name: "campuses_name_index", unique: true, using: :btree
    t.index ["slug"], name: "campuses_slug_index", unique: true, using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug",        null: false
    t.index ["slug"], name: "index_communities_on_slug", unique: true, using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.boolean  "send_copy"
    t.string   "status",     default: "unread", null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "department_faculty_associations", force: :cascade do |t|
    t.integer "department_id"
    t.integer "faculty_id"
    t.index ["department_id"], name: "index_department_faculty_associations_on_department_id", using: :btree
    t.index ["faculty_id"], name: "index_department_faculty_associations_on_faculty_id", using: :btree
  end

  create_table "dss_contacts", force: :cascade do |t|
    t.string   "slug",                    null: false
    t.string   "institution_type",        null: false
    t.string   "campus_name",             null: false
    t.string   "dss_office",              null: false
    t.text     "description_of_services"
    t.string   "contact_person"
    t.string   "contact_email"
    t.string   "contact_phone_number"
    t.string   "dss_website"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

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
    t.index ["name"], name: "index_events_on_name", unique: true, using: :btree
    t.index ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  end

  create_table "faculty_course_associations", force: :cascade do |t|
    t.integer "institutional_faculty_id"
    t.integer "institutional_course_id"
    t.index ["institutional_course_id"], name: "index_faculty_course_associations_on_institutional_course_id", using: :btree
    t.index ["institutional_faculty_id"], name: "index_faculty_course_associations_on_institutional_faculty_id", using: :btree
  end

  create_table "faculty_nomination_surveys", force: :cascade do |t|
    t.boolean "remain_anonymous",            default: true
    t.boolean "share_name_with_faculty",     default: false
    t.boolean "contact_for_more_info",       default: false
    t.string  "student_name",                default: ""
    t.string  "student_email",               default: ""
    t.string  "teaching_strategy",                           null: false
    t.text    "strategy_description",                        null: false
    t.text    "reasons_for_effectiveness",                   null: false
    t.integer "institutional_faculty_id",                    null: false
    t.string  "student_gender",              default: ""
    t.string  "student_age",                 default: ""
    t.boolean "student_dss_eligible",        default: false
    t.boolean "student_currently_using_dss", default: false
    t.index ["institutional_faculty_id"], name: "index_faculty_nomination_surveys_on_institutional_faculty_id", using: :btree
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.string   "slug"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutional_administrators", force: :cascade do |t|
    t.string "title"
    t.string "first_name",               null: false
    t.string "last_name",                null: false
    t.string "admin_email"
    t.string "admin_assistant"
    t.string "admin_assistant_email"
    t.string "admin_assistant_location"
    t.string "phone"
  end

  create_table "institutional_courses", force: :cascade do |t|
    t.string  "course_number", null: false
    t.string  "course_name",   null: false
    t.integer "campus_id"
    t.index ["campus_id"], name: "index_institutional_courses_on_campus_id", using: :btree
  end

  create_table "institutional_faculty", force: :cascade do |t|
    t.string  "first_name", null: false
    t.string  "last_name",  null: false
    t.string  "email",      null: false
    t.integer "campus_id"
    t.index ["campus_id"], name: "index_institutional_faculty_on_campus_id", using: :btree
  end

  create_table "institutional_units", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "mail_stop"
    t.integer  "institutional_unit_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                  null: false
    t.index ["campus_id"], name: "index_institutional_units_on_campus_id", using: :btree
    t.index ["institutional_unit_id"], name: "index_institutional_units_on_institutional_unit_id", using: :btree
  end

  create_table "module_assessments", force: :cascade do |t|
    t.string  "status",        default: "unpublished"
    t.integer "udl_module_id"
    t.index ["udl_module_id"], name: "index_module_assessments_on_udl_module_id", using: :btree
  end

  create_table "module_author_associations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "module_id"
    t.index ["author_id"], name: "index_module_author_associations_on_author_id", using: :btree
    t.index ["module_id"], name: "index_module_author_associations_on_module_id", using: :btree
  end

  create_table "module_faculty_associations", force: :cascade do |t|
    t.integer "faculty_id"
    t.integer "module_id"
    t.index ["faculty_id"], name: "index_module_faculty_associations_on_faculty_id", using: :btree
    t.index ["module_id"], name: "index_module_faculty_associations_on_module_id", using: :btree
  end

  create_table "module_proposals", force: :cascade do |t|
    t.string   "first_name",                       null: false
    t.string   "last_name",                        null: false
    t.string   "university",                       null: false
    t.string   "department",                       null: false
    t.string   "email",                            null: false
    t.string   "module_type",                      null: false
    t.string   "title",                            null: false
    t.text     "description",                      null: false
    t.date     "completion_date",                  null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.date     "start_date",                       null: false
    t.string   "status",          default: "open"
  end

  create_table "module_section_associations", force: :cascade do |t|
    t.integer "section_id"
    t.integer "module_id"
    t.integer "section_page_position"
    t.index ["module_id"], name: "index_module_section_associations_on_module_id", using: :btree
    t.index ["section_id"], name: "index_module_section_associations_on_section_id", using: :btree
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image_url"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "slug"
    t.text     "excerpt"
    t.boolean  "feature_article", default: false
    t.text     "feature_excerpt"
    t.text     "sidebar_excerpt"
    t.boolean  "released",        default: false, null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redesign_summaries", force: :cascade do |t|
    t.string   "uuid",                                  null: false
    t.string   "implemented_technique"
    t.text     "summary_content",                       null: false
    t.boolean  "representation",        default: false
    t.boolean  "action_expression",     default: false
    t.boolean  "engagement",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "review_ready",          default: false
    t.index ["user_id"], name: "index_redesign_summaries_on_user_id", using: :btree
    t.index ["uuid"], name: "index_redesign_summaries_on_uuid", using: :btree
  end

  create_table "redesign_summary_attachments", force: :cascade do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string   "redesign_summary_uuid",   null: false
    t.integer  "redesign_summary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["redesign_summary_id"], name: "index_redesign_summary_attachments_on_redesign_summary_id", using: :btree
    t.index ["redesign_summary_uuid"], name: "index_redesign_summary_attachments_on_redesign_summary_uuid", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "conditions"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "description"
    t.boolean  "grantable",   default: true
  end

  create_table "star_learning_communities", force: :cascade do |t|
    t.string  "title"
    t.string  "description"
    t.boolean "multi_campus"
  end

  create_table "star_learning_community_registrations", force: :cascade do |t|
    t.string   "first_name",                           null: false
    t.string   "last_name",                            null: false
    t.string   "email",                                null: false
    t.string   "phone",                                null: false
    t.string   "department",                           null: false
    t.string   "university",                           null: false
    t.string   "slc",                                  null: false
    t.text     "instructional_practice"
    t.text     "instructional_practice_justification"
    t.boolean  "udl_representation"
    t.boolean  "udl_action_expression"
    t.boolean  "udl_engagement"
    t.boolean  "network_established"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "student_nomination_faculty", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.integer "campus_department_id"
    t.integer "campus_unit_id"
    t.string  "timestamps"
    t.index ["campus_department_id"], name: "index_student_nomination_faculty_on_campus_department_id", using: :btree
    t.index ["campus_unit_id"], name: "index_student_nomination_faculty_on_campus_unit_id", using: :btree
  end

  create_table "student_nominations", force: :cascade do |t|
    t.string   "student_name"
    t.string   "student_email"
    t.string   "student_gender"
    t.string   "student_age"
    t.boolean  "share_student_name"
    t.boolean  "student_gift_card"
    t.boolean  "contact_student"
    t.boolean  "student_disability_current"
    t.boolean  "student_disability_eligible"
    t.text     "strategy_name"
    t.text     "strategy_description"
    t.text     "strategy_effectiveness"
    t.text     "quotes"
    t.integer  "student_nomination_faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "anonymous"
  end

  create_table "udl_module_sections", force: :cascade do |t|
    t.string  "title"
    t.text    "content"
    t.string  "parent"
    t.string  "slug"
    t.boolean "shared"
    t.integer "default_shared_position"
    t.boolean "hide_title",              default: false
  end

  create_table "udl_modules", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "sub_heading"
    t.text     "description"
    t.boolean  "released"
    t.date     "release_date"
    t.date     "latest_revision_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "udl_representation"
    t.boolean  "udl_action_expression"
    t.boolean  "udl_engagement"
  end

  create_table "universal_design_for_learning_resources", force: :cascade do |t|
    t.string  "title",                       null: false
    t.text    "description"
    t.string  "slug",                        null: false
    t.text    "content"
    t.boolean "published",   default: false
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
    t.boolean  "event_consent"
    t.boolean  "module_consent"
    t.text     "phone_number"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "title"
    t.string   "department"
    t.integer  "campus_id"
    t.index ["campus_id"], name: "index_users_on_campus_id", using: :btree
    t.index ["event_consent"], name: "index_users_on_event_consent", using: :btree
    t.index ["module_consent"], name: "index_users_on_module_consent", using: :btree
  end

  add_foreign_key "access_controls", "roles", on_delete: :cascade
  add_foreign_key "access_controls", "users", on_delete: :cascade
  add_foreign_key "administrator_unit_associations", "institutional_administrators"
  add_foreign_key "administrator_unit_associations", "institutional_units"
  add_foreign_key "assessment_answer_choices", "assessment_questions"
  add_foreign_key "assessment_questions", "assessment_answer_choices", column: "correct_answer_choice_id"
  add_foreign_key "assessment_questions", "udl_module_sections"
  add_foreign_key "assessment_questions", "udl_modules"
  add_foreign_key "campus_departments", "campuses"
  add_foreign_key "campus_units", "campuses"
  add_foreign_key "department_faculty_associations", "institutional_faculty", column: "faculty_id"
  add_foreign_key "department_faculty_associations", "institutional_units", column: "department_id"
  add_foreign_key "faculty_course_associations", "institutional_courses"
  add_foreign_key "faculty_course_associations", "institutional_faculty"
  add_foreign_key "faculty_nomination_surveys", "institutional_faculty"
  add_foreign_key "institutional_courses", "campuses"
  add_foreign_key "institutional_faculty", "campuses"
  add_foreign_key "institutional_units", "campuses"
  add_foreign_key "institutional_units", "institutional_units"
  add_foreign_key "module_assessments", "udl_modules"
  add_foreign_key "module_author_associations", "udl_modules", column: "module_id"
  add_foreign_key "module_author_associations", "users", column: "author_id"
  add_foreign_key "module_faculty_associations", "udl_modules", column: "module_id"
  add_foreign_key "module_faculty_associations", "users", column: "faculty_id"
  add_foreign_key "module_section_associations", "udl_module_sections", column: "section_id"
  add_foreign_key "module_section_associations", "udl_modules", column: "module_id"
  add_foreign_key "redesign_summaries", "users"
  add_foreign_key "student_nomination_faculty", "campus_departments"
  add_foreign_key "student_nomination_faculty", "campus_units"
  add_foreign_key "users", "campuses"
end
