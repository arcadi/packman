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

ActiveRecord::Schema.define(version: 20131218100231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: true do |t|
    t.string   "name",                   null: false
    t.integer  "volume",     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "number",      limit: 15,             null: false
    t.string   "name"
    t.integer  "width",                  default: 0, null: false
    t.integer  "height",                 default: 0, null: false
    t.integer  "depth",                  default: 0, null: false
    t.integer  "weight",                 default: 0, null: false
    t.integer  "stock_level",            default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["number"], name: "index_products_on_number", unique: true, using: :btree

end
