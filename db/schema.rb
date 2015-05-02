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

ActiveRecord::Schema.define(version: 20150502153407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brew_instances", force: :cascade do |t|
    t.integer  "recipe_id",          null: false
    t.datetime "created_at"
    t.integer  "grain_temp"
    t.integer  "strikewater_temp"
    t.integer  "mash_temp"
    t.float    "preboil_gravity"
    t.float    "preboil_volume"
    t.integer  "boil_time"
    t.float    "post_boil_volume"
    t.float    "original_gravity"
    t.float    "final_gravity"
    t.integer  "mash_to_boil_time"
    t.integer  "boil_to_pitch_time"
    t.text     "notes"
    t.integer  "attenuation"
  end

  create_table "components", force: :cascade do |t|
    t.string  "version"
    t.string  "name",              null: false
    t.float   "aa"
    t.float   "ppg"
    t.float   "srm"
    t.integer "attenuation"
    t.string  "temperature_range"
    t.text    "description"
    t.string  "alcohol_tolerance"
    t.string  "flocculation"
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id",    null: false
    t.integer "component_id", null: false
    t.float   "amount"
    t.integer "boil_time"
  end

  create_table "process_steps", force: :cascade do |t|
    t.integer "step_id"
    t.integer "recipe_id"
    t.text    "step_notes"
  end

  create_table "recipes", force: :cascade do |t|
    t.string  "recipe_name",    null: false
    t.float   "target_volume"
    t.float   "mash_thickness"
    t.integer "user_id"
    t.float   "efficiency"
    t.integer "mash_temp"
    t.float   "grain_temp"
    t.integer "boil_length"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "user_id",   null: false
    t.text    "body",      null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "step_name",   null: false
    t.text   "description", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
