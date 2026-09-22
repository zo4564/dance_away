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

ActiveRecord::Schema[7.2].define(version: 2026_09_22_232321) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_bookings_on_lesson_id"
    t.index ["student_id", "lesson_id"], name: "index_bookings_on_student_id_and_lesson_id", unique: true
    t.index ["student_id"], name: "index_bookings_on_student_id"
  end

  create_table "dance_classes", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "dance_style_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dance_style_id"], name: "index_dance_classes_on_dance_style_id"
  end

  create_table "dance_styles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.index ["name"], name: "index_dance_styles_on_name", unique: true
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "dance_class_id", null: false
    t.bigint "teacher_id"
    t.datetime "starts_at", null: false
    t.integer "capacity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dance_class_id"], name: "index_lessons_on_dance_class_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
    t.check_constraint "capacity > 0", name: "lessons_capacity_positive"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.check_constraint "role::text = ANY (ARRAY['student'::character varying, 'teacher'::character varying]::text[])", name: "users_role_check"
  end

  add_foreign_key "bookings", "lessons"
  add_foreign_key "bookings", "users", column: "student_id"
  add_foreign_key "dance_classes", "dance_styles"
  add_foreign_key "lessons", "dance_classes"
  add_foreign_key "lessons", "users", column: "teacher_id"
end
