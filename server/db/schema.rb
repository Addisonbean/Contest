# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_09_174755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "attempts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "problem_id", null: false
    t.bigint "contest_id", null: false
    t.integer "status"
    t.string "language"
    t.text "runtime_output"
    t.text "runtime_errors"
    t.string "uploaded_as"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "compilation_output"
    t.index ["contest_id"], name: "index_attempts_on_contest_id"
    t.index ["problem_id"], name: "index_attempts_on_problem_id"
    t.index ["status"], name: "index_attempts_on_status"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "contest_problems", force: :cascade do |t|
    t.bigint "contest_id", null: false
    t.bigint "problem_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contest_id"], name: "index_contest_problems_on_contest_id"
    t.index ["problem_id"], name: "index_contest_problems_on_problem_id"
  end

  create_table "contests", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_contests_on_active"
    t.index ["title"], name: "index_contests_on_title", unique: true
  end

  create_table "contests_problems", force: :cascade do |t|
    t.bigint "contest_id", null: false
    t.bigint "problem_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contest_id"], name: "index_contests_problems_on_contest_id"
    t.index ["problem_id"], name: "index_contests_problems_on_problem_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "example_input"
    t.text "example_output"
    t.text "test_input"
    t.text "expected_output"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "background_info"
    t.text "input_description"
    t.text "output_description"
    t.index ["title"], name: "index_problems_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth_token"
    t.boolean "admin", default: false, null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attempts", "contests"
  add_foreign_key "attempts", "problems"
  add_foreign_key "attempts", "users"
  add_foreign_key "contest_problems", "contests"
  add_foreign_key "contest_problems", "problems"
  add_foreign_key "contests_problems", "contests"
  add_foreign_key "contests_problems", "problems"
end
