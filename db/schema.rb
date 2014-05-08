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

ActiveRecord::Schema.define(version: 20140508230737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_groups", force: true do |t|
    t.integer  "usda_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_items", force: true do |t|
    t.integer  "usda_id"
    t.integer  "food_group_id"
    t.string   "description"
    t.float    "n_factor"
    t.float    "pro_factor"
    t.float    "fat_factor"
    t.float    "cho_factor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nutrients", force: true do |t|
    t.integer  "usda_id"
    t.string   "unit"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nutritional_contents", force: true do |t|
    t.integer  "food_item_id"
    t.integer  "nutrient_id"
    t.float    "amount_per_100g"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weights", force: true do |t|
    t.integer  "food_item_id"
    t.string   "unit_multiplier"
    t.string   "unit"
    t.float    "weight_in_grams"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
