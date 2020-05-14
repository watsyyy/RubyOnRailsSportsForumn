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

ActiveRecord::Schema.define(version: 20181220105759) do

  create_table "ar_internal_metadata", primary_key: "key", force: true do |t|
    t.string   "value",      limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "ar_internal_metadata", ["key"], name: "sqlite_autoindex_ar_internal_metadata_1", unique: true

  create_table "categories", force: true do |t|
    t.string   "name",       limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories_discussions", id: false, force: true do |t|
    t.integer "discussion_id"
    t.integer "category_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "discussion_id"
    t.string   "name",          limit: nil
    t.string   "email",         limit: nil
    t.text     "body"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "discussions", force: true do |t|
    t.string   "title",        limit: nil
    t.text     "body"
    t.datetime "published_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "excerpt",      limit: nil
    t.string   "location",     limit: nil
    t.integer  "user_id"
  end

  create_table "discussions_categories", id: false, force: true do |t|
    t.integer "discussion_id"
    t.integer "category_id"
  end

  add_index "discussions_categories", ["category_id"], name: "index_discussions_categories_on_category_id"
  add_index "discussions_categories", ["discussion_id"], name: "index_discussions_categories_on_discussion_id"

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "name",       limit: nil
    t.date     "birthday"
    t.text     "bio"
    t.string   "color",      limit: nil
    t.string   "twitter",    limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
