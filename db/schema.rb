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

ActiveRecord::Schema.define(version: 20161003212300) do

  create_table "crises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "theme"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
  end

  create_table "question_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "survey_response_id"
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.index ["question_id"], name: "index_question_responses_on_question_id", using: :btree
    t.index ["survey_response_id"], name: "index_question_responses_on_survey_response_id", using: :btree
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "survey_id"
    t.integer  "question_group_id"
    t.text     "content",           limit: 65535
    t.string   "questions"
    t.string   "answer_type"
    t.integer  "max_value"
    t.integer  "min_value"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "number"
    t.integer  "user_id"
    t.index ["question_group_id"], name: "index_questions_on_question_group_id", using: :btree
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "survey_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "survey_id"
    t.string   "participant_id"
    t.string   "participant_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "crisis_id"
    t.string   "orginisation_name"
    t.integer  "iteration"
    t.string   "latitude"
    t.string   "longitude"
    t.date     "date"
    t.integer  "user_id"
    t.index ["crisis_id"], name: "index_survey_responses_on_crisis_id", using: :btree
    t.index ["survey_id"], name: "index_survey_responses_on_survey_id", using: :btree
  end

  create_table "surveys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "roles_mask"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "question_responses", "questions"
  add_foreign_key "question_responses", "survey_responses"
  add_foreign_key "questions", "question_groups"
  add_foreign_key "questions", "surveys"
  add_foreign_key "survey_responses", "crises"
  add_foreign_key "survey_responses", "surveys"
end
