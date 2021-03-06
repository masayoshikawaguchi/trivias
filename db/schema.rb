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

ActiveRecord::Schema.define(version: 20180317050345) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "trivian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trivian_id"], name: "index_clips_on_trivian_id", using: :btree
    t.index ["user_id", "trivian_id"], name: "index_clips_on_user_id_and_trivian_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_clips_on_user_id", using: :btree
  end

  create_table "trivians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "clips_count"
    t.index ["category_id"], name: "index_trivians_on_category_id", using: :btree
    t.index ["user_id"], name: "index_trivians_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "clips", "trivians"
  add_foreign_key "clips", "users"
  add_foreign_key "trivians", "categories"
  add_foreign_key "trivians", "users"
end
