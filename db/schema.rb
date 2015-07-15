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

ActiveRecord::Schema.define(version: 20150715002451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_items", id: false, force: :cascade do |t|
    t.integer "item_id",     null: false
    t.integer "category_id", null: false
  end

  add_index "categories_items", ["category_id"], name: "index_categories_items_on_category_id", using: :btree
  add_index "categories_items", ["item_id"], name: "index_categories_items_on_item_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "item_id",    null: false
    t.string   "image_uid"
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.string   "code"
    t.string   "caption",                       null: false
    t.string   "description"
    t.integer  "purchase_price"
    t.integer  "selling_price"
    t.boolean  "is_available",   default: true, null: false
    t.string   "condition"
    t.string   "measurements"
    t.date     "date_acquired"
    t.date     "date_sold"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "thumb_image_id"
  end

  create_table "items_keywords", id: false, force: :cascade do |t|
    t.integer "item_id",    null: false
    t.integer "keyword_id", null: false
  end

  add_index "items_keywords", ["item_id"], name: "index_items_keywords_on_item_id", using: :btree
  add_index "items_keywords", ["keyword_id"], name: "index_items_keywords_on_keyword_id", using: :btree

  create_table "keywords", force: :cascade do |t|
    t.string   "phrase",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "is_admin",        default: "false", null: false
    t.string   "first_name",                        null: false
    t.string   "last_name",                         null: false
    t.string   "email",                             null: false
    t.string   "password_digest",                   null: false
    t.boolean  "is_active",       default: true,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
