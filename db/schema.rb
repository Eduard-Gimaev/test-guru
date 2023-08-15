# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_15_093950) do

  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.string "correct"
    t.integer "questions_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questions_id"], name: "index_answers_on_questions_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "body"
    t.integer "level"
    t.integer "tests_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tests_id"], name: "index_questions_on_tests_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "result"
    t.integer "tests_id", null: false
    t.integer "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tests_id"], name: "index_results_on_tests_id"
    t.index ["users_id"], name: "index_results_on_users_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level"
    t.integer "categories_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categories_id"], name: "index_tests_on_categories_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user"
    t.integer "results_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["results_id"], name: "index_users_on_results_id"
  end

  add_foreign_key "answers", "questions", column: "questions_id"
  add_foreign_key "questions", "tests", column: "tests_id"
  add_foreign_key "results", "tests", column: "tests_id"
  add_foreign_key "results", "users", column: "users_id"
  add_foreign_key "tests", "categories", column: "categories_id"
  add_foreign_key "users", "results", column: "results_id"
end
