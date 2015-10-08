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

ActiveRecord::Schema.define(version: 20151008194400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kardma_exchanges", force: :cascade do |t|
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.integer  "station_id"
    t.boolean  "complete",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "kardmas", force: :cascade do |t|
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rated_user_id"
    t.string   "comment",       null: false
    t.integer  "score",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 50, null: false
    t.string   "username",        limit: 50, null: false
    t.string   "picture",                    null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
