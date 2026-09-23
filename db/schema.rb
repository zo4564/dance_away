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

ActiveRecord::Schema[7.2].define(version: 2026_09_23_202528) do
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
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "teacher_applications", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "lesson_id", null: false
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_teacher_applications_on_lesson_id"
    t.index ["teacher_id", "lesson_id"], name: "index_teacher_applications_on_teacher_id_and_lesson_id", unique: true
    t.index ["teacher_id"], name: "index_teacher_applications_on_teacher_id"
    t.check_constraint "status::text = ANY (ARRAY['pending'::character varying, 'accepted'::character varying, 'rejected'::character varying]::text[])", name: "teacher_applications_status_check"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "lessons"
  add_foreign_key "bookings", "users", column: "student_id"
  add_foreign_key "dance_classes", "dance_styles"
  add_foreign_key "lessons", "dance_classes"
  add_foreign_key "lessons", "users", column: "teacher_id"
  add_foreign_key "teacher_applications", "lessons"
  add_foreign_key "teacher_applications", "users", column: "teacher_id"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
