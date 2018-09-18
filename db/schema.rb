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

ActiveRecord::Schema.define(version: 20180821030448) do

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "comment_writer"
    t.string   "comment_content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "history_q_ID"
    t.integer  "history_q_result"
    t.text     "h_result"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "hospital_reviews", force: :cascade do |t|
    t.integer  "review_userID"
    t.string   "review_content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "hospital_name"
    t.string   "address"
    t.string   "hospital_number"
    t.string   "hospital_infom"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "new_s", force: :cascade do |t|
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
    t.string   "User"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "new_s", ["email"], name: "index_new_s_on_email", unique: true
  add_index "new_s", ["reset_password_token"], name: "index_new_s_on_reset_password_token", unique: true

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "writer"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_ids", force: :cascade do |t|
    t.integer  "age"
    t.integer  "user_id"
    t.string   "gender"
    t.string   "drink_frequency"
    t.string   "smoke"
    t.string   "sleep_time"
    t.integer  "shape"
    t.string   "color"
    t.string   "smell"
    t.string   "blood"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "question_results", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "shape"
    t.string   "color"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
