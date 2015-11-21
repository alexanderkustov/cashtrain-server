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

ActiveRecord::Schema.define(version: 20151121194057) do

  create_table "feedbacks", force: true do |t|
    t.string   "train_id",   limit: nil
    t.float    "feedback"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "offers", force: true do |t|
    t.string   "title",       limit: nil
    t.string   "description", limit: nil
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address",     limit: nil
    t.string   "train_id",    limit: nil
    t.integer  "points"
  end

  create_table "stations", force: true do |t|
    t.string   "name",          limit: nil
    t.string   "code",          limit: nil
    t.string   "nlc",           limit: nil
    t.float    "latitude"
    t.float    "longitude"
    t.string   "group_station", limit: nil
    t.string   "short_name",    limit: nil
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "address",       limit: nil
  end

end
