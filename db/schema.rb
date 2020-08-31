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

ActiveRecord::Schema.define(version: 2020_08_19_193747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_controls", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], name: "index_access_controls_on_role_id"
    t.index ["user_id"], name: "index_access_controls_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "administrator_unit_associations", id: :serial, force: :cascade do |t|
    t.integer "institutional_administrator_id"
    t.integer "institutional_unit_id"
    t.boolean "current_chair", default: false
    t.boolean "current_dean"
    t.index ["institutional_administrator_id"], name: "index_admin_unit_associations_on_administrator_id"
    t.index ["institutional_unit_id"], name: "index_admin_unit_associations_on_unit_id"
  end

  create_table "assessment_answer_choices", id: :serial, force: :cascade do |t|
    t.string "text"
    t.string "explanation"
    t.integer "position"
    t.integer "assessment_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assessment_question_id"], name: "index_assessment_answer_choices_on_assessment_question_id"
  end

  create_table "assessment_questions", id: :serial, force: :cascade do |t|
    t.string "question"
    t.string "explanation"
    t.integer "udl_module_section_id"
    t.boolean "ordered"
    t.integer "udl_module_id"
    t.integer "correct_answer_choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["correct_answer_choice_id"], name: "index_assessment_questions_on_correct_answer_choice_id"
    t.index ["udl_module_id"], name: "index_assessment_questions_on_udl_module_id"
    t.index ["udl_module_section_id"], name: "index_assessment_questions_on_udl_module_section_id"
  end

  create_table "campus_departments", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "campus_id"
    t.string "chair_first_name"
    t.string "chair_last_name"
    t.string "chair_email"
    t.string "timestamps"
    t.index ["campus_id"], name: "index_campus_departments_on_campus_id"
  end

  create_table "campus_units", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "campus_id"
    t.string "director_first_name"
    t.string "director_last_name"
    t.string "director_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["campus_id"], name: "index_campus_units_on_campus_id"
  end

  create_table "campuses", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", null: false
    t.string "institution_type", null: false
    t.string "website_url"
    t.string "address_1", null: false
    t.string "address_2"
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "slug", null: false
    t.integer "director_id"
    t.text "history"
    t.index ["abbreviation"], name: "campuses_abbreviation_index", unique: true
    t.index ["director_id"], name: "index_campuses_on_director_id"
    t.index ["name"], name: "campuses_name_index", unique: true
    t.index ["slug"], name: "campuses_slug_index", unique: true
  end

  create_table "case_study_proposals", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "university", null: false
    t.string "department", null: false
    t.string "email", null: false
    t.string "module_type", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.date "completion_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date", null: false
    t.string "status", default: "open"
    t.text "strategy_link"
    t.boolean "accepted", default: false
    t.boolean "denied", default: false
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "communities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["slug"], name: "index_communities_on_slug", unique: true
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.boolean "send_copy"
    t.string "status", default: "unread", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "department_faculty_associations", id: :serial, force: :cascade do |t|
    t.integer "department_id"
    t.integer "faculty_id"
    t.index ["department_id"], name: "index_department_faculty_associations_on_department_id"
    t.index ["faculty_id"], name: "index_department_faculty_associations_on_faculty_id"
  end

  create_table "dss_contacts", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "institution_type", null: false
    t.string "campus_name", null: false
    t.string "dss_office", null: false
    t.text "description_of_services"
    t.string "contact_person"
    t.string "contact_email"
    t.string "contact_phone_number"
    t.string "dss_website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "address"
    t.string "dates"
    t.string "website"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
  end

  create_table "faculty_course_associations", id: :serial, force: :cascade do |t|
    t.integer "institutional_faculty_id"
    t.integer "institutional_course_id"
    t.index ["institutional_course_id"], name: "index_faculty_course_associations_on_institutional_course_id"
    t.index ["institutional_faculty_id"], name: "index_faculty_course_associations_on_institutional_faculty_id"
  end

  create_table "faculty_nomination_surveys", id: :serial, force: :cascade do |t|
    t.boolean "remain_anonymous", default: true
    t.boolean "share_name_with_faculty", default: false
    t.boolean "contact_for_more_info", default: false
    t.string "student_name", default: ""
    t.string "student_email", default: ""
    t.string "teaching_strategy", null: false
    t.text "strategy_description", null: false
    t.text "reasons_for_effectiveness", null: false
    t.integer "institutional_faculty_id", null: false
    t.string "student_gender", default: ""
    t.string "student_age", default: ""
    t.boolean "student_dss_eligible", default: false
    t.boolean "student_currently_using_dss", default: false
    t.text "quotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campus_id"
    t.string "faculty_first_name"
    t.string "faculty_last_name"
    t.integer "department_id"
    t.boolean "reviewed"
    t.boolean "not_appropriate", default: false
    t.index ["campus_id"], name: "index_faculty_nomination_surveys_on_campus_id"
    t.index ["department_id"], name: "index_faculty_nomination_surveys_on_department_id"
    t.index ["institutional_faculty_id"], name: "index_faculty_nomination_surveys_on_institutional_faculty_id"
  end

  create_table "frequently_asked_questions", id: :serial, force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.string "slug"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutional_administrators", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "admin_email"
    t.string "admin_assistant"
    t.string "admin_assistant_email"
    t.string "admin_assistant_location"
    t.string "phone"
  end

  create_table "institutional_courses", id: :serial, force: :cascade do |t|
    t.string "course_number", null: false
    t.string "course_name", null: false
    t.integer "campus_id"
    t.index ["campus_id"], name: "index_institutional_courses_on_campus_id"
  end

  create_table "institutional_faculty", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.integer "campus_id"
    t.string "student_generated_email"
    t.boolean "student_generated"
    t.index ["campus_id"], name: "index_institutional_faculty_on_campus_id"
  end

  create_table "institutional_units", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "mail_stop"
    t.integer "institutional_unit_id"
    t.integer "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug", null: false
    t.string "abbreviation"
    t.index ["campus_id"], name: "index_institutional_units_on_campus_id"
    t.index ["institutional_unit_id"], name: "index_institutional_units_on_institutional_unit_id"
  end

  create_table "media_consents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "consent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "module_assessments", id: :serial, force: :cascade do |t|
    t.string "status", default: "unpublished"
    t.integer "udl_module_id"
    t.index ["udl_module_id"], name: "index_module_assessments_on_udl_module_id"
  end

  create_table "module_author_associations", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.integer "module_id"
    t.index ["author_id"], name: "index_module_author_associations_on_author_id"
    t.index ["module_id"], name: "index_module_author_associations_on_module_id"
  end

  create_table "module_faculty_associations", id: :serial, force: :cascade do |t|
    t.integer "faculty_id"
    t.integer "module_id"
    t.index ["faculty_id"], name: "index_module_faculty_associations_on_faculty_id"
    t.index ["module_id"], name: "index_module_faculty_associations_on_module_id"
  end

  create_table "module_section_associations", id: :serial, force: :cascade do |t|
    t.integer "section_id"
    t.integer "module_id"
    t.integer "section_page_position"
    t.index ["module_id"], name: "index_module_section_associations_on_module_id"
    t.index ["section_id"], name: "index_module_section_associations_on_section_id"
  end

  create_table "news_articles", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.text "excerpt"
    t.boolean "feature_article", default: false
    t.text "feature_excerpt"
    t.text "sidebar_excerpt"
    t.boolean "released", default: false, null: false
  end

  create_table "news_letter_subscriptions", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "company"
    t.string "email", null: false
    t.boolean "case_studies", default: false
    t.boolean "learning_communities", default: false
    t.boolean "research", default: false
    t.boolean "udl_in_higher_ed", default: false
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redesign_summaries", id: :serial, force: :cascade do |t|
    t.string "uuid", null: false
    t.string "implemented_technique"
    t.text "summary_content", null: false
    t.boolean "representation", default: false
    t.boolean "action_expression", default: false
    t.boolean "engagement", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.boolean "review_ready", default: false
    t.index ["user_id"], name: "index_redesign_summaries_on_user_id"
    t.index ["uuid"], name: "index_redesign_summaries_on_uuid"
  end

  create_table "redesign_summary_attachments", id: :serial, force: :cascade do |t|
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string "redesign_summary_uuid", null: false
    t.integer "redesign_summary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["redesign_summary_id"], name: "index_redesign_summary_attachments_on_redesign_summary_id"
    t.index ["redesign_summary_uuid"], name: "index_redesign_summary_attachments_on_redesign_summary_uuid"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "conditions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.boolean "grantable", default: true
  end

  create_table "sendgrid_event_posts", force: :cascade do |t|
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sendgrid_events", force: :cascade do |t|
    t.string "sg_event_id"
    t.string "sg_message_id"
    t.string "event"
    t.string "email"
    t.datetime "timestamp"
    t.string "smtp_id"
    t.string "ip"
    t.boolean "tls"
    t.boolean "cert_err"
    t.string "timestamps"
    t.index ["email"], name: "index_sendgrid_events_on_email"
    t.index ["sg_event_id"], name: "index_sendgrid_events_on_sg_event_id", unique: true
  end

  create_table "star_learning_communities", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "multi_campus"
  end

  create_table "star_learning_community_registrations", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "department", null: false
    t.string "university", null: false
    t.string "slc", null: false
    t.text "instructional_practice"
    t.text "instructional_practice_justification"
    t.boolean "udl_representation"
    t.boolean "udl_action_expression"
    t.boolean "udl_engagement"
    t.boolean "network_established"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_nomination_faculty", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "campus_department_id"
    t.integer "campus_unit_id"
    t.string "timestamps"
    t.index ["campus_department_id"], name: "index_student_nomination_faculty_on_campus_department_id"
    t.index ["campus_unit_id"], name: "index_student_nomination_faculty_on_campus_unit_id"
  end

  create_table "student_nominations", id: :serial, force: :cascade do |t|
    t.string "student_name"
    t.string "student_email"
    t.string "student_gender"
    t.string "student_age"
    t.boolean "share_student_name"
    t.boolean "student_gift_card"
    t.boolean "contact_student"
    t.boolean "student_disability_current"
    t.boolean "student_disability_eligible"
    t.text "strategy_name"
    t.text "strategy_description"
    t.text "strategy_effectiveness"
    t.text "quotes"
    t.integer "student_nomination_faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "anonymous"
  end

  create_table "student_support_program_images", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "caption"
    t.bigint "student_support_program_id"
    t.index ["student_support_program_id"], name: "index_student_support_program_images_id"
  end

  create_table "student_support_programs", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "video_link"
    t.text "mission_statement"
    t.text "description_of_services"
    t.text "program_overview"
    t.string "program_size"
    t.text "resources"
    t.text "contact_info"
    t.boolean "public"
    t.boolean "fee_based"
    t.string "program_cost"
    t.string "target_population"
    t.string "institution_size"
    t.string "institution_type"
    t.text "application_process"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean "target_population_specified_ld"
    t.boolean "target_population_adhd"
    t.boolean "target_population_aut_asp"
    t.boolean "target_population_efc"
    t.string "target_population_other"
    t.string "vision_statement"
    t.index ["slug"], name: "index_student_support_programs_on_slug", unique: true
  end

  create_table "student_support_summit_questionnaires", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "most_excited_about"
    t.text "issues"
    t.text "challenges"
    t.text "well_spent_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_support_summit_registrations", force: :cascade do |t|
    t.string "program_name"
    t.string "contact_name"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "institution"
    t.string "first_attendee_first_name"
    t.string "first_attendee_last_name"
    t.string "first_attendee_email"
    t.string "first_attendee_phone"
    t.string "first_attendee_address"
    t.string "first_attendee_address_2"
    t.string "first_attendee_city"
    t.string "first_attendee_state"
    t.string "first_attendee_zip"
    t.string "first_attendee_arrival_date"
    t.string "first_attendee_departure_date"
    t.string "first_attendee_travel_by"
    t.text "first_attendee_dietary_restrictions"
    t.text "first_attendee_accessability_needs"
    t.string "second_attendee_first_name"
    t.string "second_attendee_last_name"
    t.string "second_attendee_email"
    t.string "second_attendee_phone"
    t.string "second_attendee_address"
    t.string "second_attendee_address_2"
    t.string "second_attendee_city"
    t.string "second_attendee_state"
    t.string "second_attendee_zip"
    t.string "second_attendee_arrival_date"
    t.string "second_attendee_departure_date"
    t.string "second_attendee_travel_by"
    t.text "second_attendee_dietary_restrictions"
    t.text "second_attendee_accessability_needs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "shared_resource"
    t.text "shared_problem"
  end

  create_table "think_udl_snippets", force: :cascade do |t|
    t.string "slug", null: false
    t.string "video_url", null: false
    t.string "title", null: false
    t.text "description"
    t.string "episode_url", null: false
    t.string "episode_title", null: false
    t.text "episode_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "three_two_one_video_proposals", force: :cascade do |t|
    t.string "token", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "institution"
    t.string "title"
    t.boolean "representation"
    t.boolean "action_expression"
    t.boolean "engagement"
    t.text "instructional_practice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "three_two_one_videos", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.string "youtube_id", null: false
    t.text "caption"
    t.text "notes"
    t.boolean "released", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description", default: ""
  end

  create_table "udl_module_feedbacks", force: :cascade do |t|
    t.boolean "resource_was_helpful"
    t.bigint "udl_module_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["udl_module_id"], name: "index_udl_module_feedbacks_on_udl_module_id"
    t.index ["user_id"], name: "index_udl_module_feedbacks_on_user_id"
  end

  create_table "udl_module_sections", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "parent"
    t.string "slug"
    t.boolean "shared"
    t.integer "default_shared_position"
    t.boolean "hide_title", default: false
    t.string "voiceover_audio"
  end

  create_table "udl_module_surveys", force: :cascade do |t|
    t.bigint "udl_module_feedback_id"
    t.bigint "user_id"
    t.bigint "udl_module_id"
    t.string "length_of_time", default: ""
    t.string "organization_of_module", default: ""
    t.string "quality_of_content", default: ""
    t.string "relevance_to_my_needs"
    t.string "plan_to_implement", default: ""
    t.string "likely_to_recommend", default: ""
    t.string "access_another_module", default: ""
    t.text "additional_feedback", default: ""
    t.boolean "join_mailing_list", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["udl_module_feedback_id"], name: "index_udl_module_surveys_on_udl_module_feedback_id"
    t.index ["udl_module_id"], name: "index_udl_module_surveys_on_udl_module_id"
    t.index ["user_id"], name: "index_udl_module_surveys_on_user_id"
  end

  create_table "udl_modules", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.string "sub_heading"
    t.text "description"
    t.boolean "released"
    t.date "release_date"
    t.date "latest_revision_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "udl_representation"
    t.boolean "udl_action_expression"
    t.boolean "udl_engagement"
    t.string "title_image_file_name"
    t.string "title_image_content_type"
    t.integer "title_image_file_size"
    t.datetime "title_image_updated_at"
    t.bigint "module_id"
    t.string "module_type"
    t.index ["module_id"], name: "index_udl_modules_on_module_id"
  end

  create_table "universal_design_for_learning_resources", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "slug", null: false
    t.text "content"
    t.boolean "published", default: false
  end

  create_table "user_assessment_answer_choice_associations", id: :serial, force: :cascade do |t|
    t.integer "user_module_assessment_id"
    t.integer "assessment_answer_choice_id"
    t.index ["assessment_answer_choice_id"], name: "user_assessment_association_answer_choice_index"
    t.index ["user_module_assessment_id"], name: "user_assessment_association_assessment_index"
  end

  create_table "user_assessment_question_associations", force: :cascade do |t|
    t.bigint "user_module_assessment_id"
    t.bigint "assessment_question_id"
    t.integer "position"
    t.jsonb "answer_choices"
    t.integer "selected_answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.index ["assessment_question_id"], name: "user_assessment_question_association_question_index"
    t.index ["user_module_assessment_id"], name: "user_assessment_question_association_assessment_index"
  end

  create_table "user_categories", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "selectable", default: false
  end

  create_table "user_category_associations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "user_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_category_id"], name: "index_user_category_associations_on_user_category_id"
    t.index ["user_id"], name: "index_user_category_associations_on_user_id"
  end

  create_table "user_category_udl_module_survey_associations", force: :cascade do |t|
    t.bigint "user_category_id"
    t.bigint "udl_module_survey_id"
    t.index ["udl_module_survey_id"], name: "index_user_cat_mod_survey_on_mod_survey_id"
    t.index ["user_category_id"], name: "index_user_cat_mod_survey_on_user_cat_id"
  end

  create_table "user_module_assessments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "udl_module_id"
    t.boolean "completed"
    t.json "questions_order"
    t.string "score"
    t.bigint "user_module_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["udl_module_id"], name: "index_user_module_assessments_on_udl_module_id"
    t.index ["user_id"], name: "index_user_module_assessments_on_user_id"
    t.index ["user_module_history_id"], name: "index_user_module_assessments_on_user_module_history_id"
  end

  create_table "user_module_histories", force: :cascade do |t|
    t.bigint "udl_module_id"
    t.bigint "user_id"
    t.datetime "last_viewed"
    t.boolean "assessment_attempted"
    t.boolean "assessment_passed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["udl_module_id"], name: "index_user_module_histories_on_udl_module_id"
    t.index ["user_id"], name: "index_user_module_histories_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.string "auth_token"
    t.string "activation_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean "event_consent"
    t.boolean "module_consent"
    t.text "phone_number"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "title"
    t.string "department"
    t.integer "campus_id"
    t.boolean "activated", default: false
    t.index ["campus_id"], name: "index_users_on_campus_id"
    t.index ["event_consent"], name: "index_users_on_event_consent"
    t.index ["module_consent"], name: "index_users_on_module_consent"
  end

  create_table "virtual_conference_proposals", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "presentation_theme", null: false
    t.string "presentation_title", null: false
    t.text "presentation_description", null: false
    t.text "presentation_takeaway", null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtual_conference_registrations", force: :cascade do |t|
    t.string "token", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "state", null: false
    t.boolean "parent", default: false
    t.boolean "student", default: false
    t.boolean "education_professional", default: false
    t.string "theme_rank_1"
    t.string "theme_rank_2"
    t.string "theme_rank_3"
    t.string "theme_rank_4"
    t.integer "number_of_participants", null: false
    t.boolean "mailing_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  add_foreign_key "faculty_nomination_surveys", "campuses"
  add_foreign_key "faculty_nomination_surveys", "institutional_faculty"
  add_foreign_key "faculty_nomination_surveys", "institutional_units", column: "department_id"
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
  add_foreign_key "student_support_program_images", "student_support_programs"
  add_foreign_key "udl_module_feedbacks", "udl_modules"
  add_foreign_key "udl_module_feedbacks", "users"
  add_foreign_key "udl_module_surveys", "udl_module_feedbacks"
  add_foreign_key "udl_module_surveys", "udl_modules"
  add_foreign_key "udl_module_surveys", "users"
  add_foreign_key "udl_modules", "udl_modules", column: "module_id"
  add_foreign_key "user_assessment_answer_choice_associations", "assessment_answer_choices"
  add_foreign_key "user_assessment_answer_choice_associations", "user_module_assessments"
  add_foreign_key "user_assessment_question_associations", "assessment_answer_choices", column: "selected_answer_id"
  add_foreign_key "user_assessment_question_associations", "assessment_questions"
  add_foreign_key "user_assessment_question_associations", "user_module_assessments"
  add_foreign_key "user_category_associations", "user_categories"
  add_foreign_key "user_category_associations", "users"
  add_foreign_key "user_category_udl_module_survey_associations", "udl_module_surveys"
  add_foreign_key "user_category_udl_module_survey_associations", "user_categories"
  add_foreign_key "user_module_assessments", "udl_modules"
  add_foreign_key "user_module_assessments", "user_module_histories"
  add_foreign_key "user_module_assessments", "users"
  add_foreign_key "user_module_histories", "udl_modules"
  add_foreign_key "user_module_histories", "users"
  add_foreign_key "users", "campuses"
end
