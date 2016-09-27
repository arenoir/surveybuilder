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

ActiveRecord::Schema.define(version: 20160927170029) do

  create_table "crises", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "country",    limit: 255
    t.datetime "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "question_groups", force: :cascade do |t|
    t.string   "theme",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "question_responses", force: :cascade do |t|
    t.integer  "survey_response_id", limit: 4
    t.integer  "question_id",        limit: 4
    t.string   "answer",             limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "question_responses", ["question_id"], name: "index_question_responses_on_question_id", using: :btree
  add_index "question_responses", ["survey_response_id"], name: "index_question_responses_on_survey_response_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id",         limit: 4
    t.integer  "question_group_id", limit: 4
    t.text     "content",           limit: 65535
    t.string   "questions",         limit: 255
    t.string   "answer_type",       limit: 255
    t.integer  "max_value",         limit: 4
    t.integer  "min_value",         limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "number",            limit: 4
  end

  add_index "questions", ["question_group_id"], name: "index_questions_on_question_group_id", using: :btree
  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "survey_responses", force: :cascade do |t|
    t.integer  "survey_id",         limit: 4
    t.string   "participant_id",    limit: 255
    t.string   "participant_type",  limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "crisis_id",         limit: 4
    t.string   "orginisation_name", limit: 255
    t.integer  "iteration",         limit: 4
    t.string   "latitude",          limit: 255
    t.string   "longitude",         limit: 255
  end

  add_index "survey_responses", ["crisis_id"], name: "index_survey_responses_on_crisis_id", using: :btree
  add_index "survey_responses", ["survey_id"], name: "index_survey_responses_on_survey_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "question_responses", "questions"
  add_foreign_key "question_responses", "survey_responses"
  add_foreign_key "questions", "question_groups"
  add_foreign_key "questions", "surveys"
  add_foreign_key "survey_responses", "crises"
  add_foreign_key "survey_responses", "surveys"
end
