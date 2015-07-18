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

ActiveRecord::Schema.define(version: 20150717151553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true, using: :btree

  create_table "preferences", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "example_url1"
    t.string   "example_url1_img"
    t.string   "example_url2"
    t.string   "example_url2_img"
    t.string   "techinterests"
    t.string   "location"
    t.string   "skill"
    t.string   "email"
    t.string   "website"
    t.string   "job"
    t.text     "about"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "skill_id"
    t.integer  "preference_id"
  end

  add_index "projects", ["preference_id"], name: "index_projects_on_preference_id", using: :btree
  add_index "projects", ["skill_id"], name: "index_projects_on_skill_id", using: :btree

  create_table "rejects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rejects", ["user_id", "reject_id"], name: "index_rejects_on_user_id_and_reject_id", unique: true, using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar_url"
    t.string   "username"
    t.string   "name"
    t.string   "repos_url"
    t.string   "token"
    t.string   "github_id"
    t.string   "example_url1"
    t.string   "example_url1_img"
    t.string   "example_url2"
    t.string   "example_url2_img"
    t.string   "techinterests"
    t.string   "location"
    t.string   "website"
    t.string   "job"
    t.string   "about"
    t.integer  "skill_id"
    t.integer  "preference_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["preference_id"], name: "index_users_on_preference_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["skill_id"], name: "index_users_on_skill_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
