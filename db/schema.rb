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

ActiveRecord::Schema.define(version: 20170604142125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "photo_category"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "description"
    t.integer  "archivestrip_id"
    t.string   "yearcompleted"
    t.string   "location"
  end

  create_table "archivestrips", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "cover"
    t.integer  "order_id"
    t.string   "cover_category"
  end

  create_table "awards", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "photo_category"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "link"
    t.text     "description"
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "photo_category"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "description"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "photo"
    t.string   "photo_category"
    t.integer  "order_id"
    t.integer  "priority_id"
  end

  create_table "landscapes", force: :cascade do |t|
    t.string   "photo"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "image_id"
  end

  create_table "officepics", force: :cascade do |t|
    t.string   "photo"
    t.string   "photo_category"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "description"
  end

  create_table "portraits", force: :cascade do |t|
    t.string   "photo"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "image_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "strip_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "cover_id"
    t.string   "location"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "yearcompleted"
    t.integer  "order_id"
  end

  add_index "projects", ["strip_id"], name: "index_projects_on_strip_id", using: :btree
  add_index "projects", ["user_id", "strip_id"], name: "index_projects_on_user_id_and_strip_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "publications", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "photo_category"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "link"
    t.text     "description"
  end

  create_table "squares", force: :cascade do |t|
    t.string   "photo"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "image_id"
  end

  create_table "strips", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.string   "category"
    t.string   "cover"
    t.integer  "order_id"
    t.string   "cover_category"
  end

  create_table "travel_photos", force: :cascade do |t|
    t.integer  "travel_id"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest", default: "MATRA2017"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "avatar"
    t.string   "role"
    t.string   "designation"
    t.string   "avatar_category"
    t.text     "description"
    t.integer  "order_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "category"
    t.string   "photo"
    t.string   "photo_category"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_foreign_key "projects", "strips"
  add_foreign_key "projects", "users"
end
