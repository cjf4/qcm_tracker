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

ActiveRecord::Schema.define(version: 20140112215546) do

  create_table "clients", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "company"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true
  add_index "clients", ["remember_token"], name: "index_clients_on_remember_token"

  create_table "projects", force: true do |t|
    t.string   "month"
    t.integer  "year"
    t.float    "socialmedia"
    t.float    "seo"
    t.float    "sales"
    t.float    "web_design"
    t.float    "creative_design"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id"

end
