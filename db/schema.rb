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

ActiveRecord::Schema.define(version: 20160912190508) do

  create_table "question_groups", force: :cascade do |t|
    t.string   "theme"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_responses", force: :cascade do |t|
    t.integer  "survey_response_id"
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "question_responses", ["question_id"], name: "index_question_responses_on_question_id"
  add_index "question_responses", ["survey_response_id"], name: "index_question_responses_on_survey_response_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "question_group_id"
    t.text     "content"
    t.string   "questions"
    t.string   "answer_type"
    t.integer  "max_value"
    t.integer  "min_value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "questions", ["question_group_id"], name: "index_questions_on_question_group_id"
  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id"

  create_table "survey_responses", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "participant_id"
    t.string   "participant_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "survey_responses", ["survey_id"], name: "index_survey_responses_on_survey_id"

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
