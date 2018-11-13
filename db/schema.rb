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

ActiveRecord::Schema.define(version: 20180125203342) do

  create_table "filials", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string "registry_number", null: false
    t.string "period", null: false
    t.string "level", null: false
    t.string "specialty", null: false
    t.string "form_of_training", null: false
    t.string "ovz", null: false
    t.float "mark", null: false
    t.boolean "verification"
    t.integer "section_id"
    t.integer "recruitment"
    t.integer "studying"
    t.integer "release"
    t.string "comment"
    t.integer "filial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filial_id"], name: "index_lines_on_filial_id"
    t.index ["section_id"], name: "index_lines_on_section_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.string "name", null: false
    t.string "kind", null: false
    t.integer "value", null: false
    t.integer "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_reasons_on_line_id"
  end

  create_table "role_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_users_on_role_id"
    t.index ["user_id"], name: "index_role_users_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "kind", null: false
    t.string "comment"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_sections_on_task_id"
  end

  create_table "sourses", force: :cascade do |t|
    t.integer "value", null: false
    t.string "kind", null: false
    t.string "number", null: false
    t.string "comment"
    t.string "kind1", null: false
    t.date "date_of", null: false
    t.integer "reason_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reason_id"], name: "index_sourses_on_reason_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "year", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
