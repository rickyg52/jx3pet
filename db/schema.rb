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

ActiveRecord::Schema.define(version: 20161224091924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token",                null: false
    t.string   "app_name"
    t.boolean  "active",       default: true
    t.date     "expiry"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["access_token"], name: "index_api_keys_on_access_token", unique: true, using: :btree
  end

  create_table "blacklists", force: :cascade do |t|
    t.bigint "qq_num", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer "server_id",                                    null: false
    t.bigint  "group_num",                                    null: false
    t.string  "report_format", default: "{time} {alias} 502", null: false
    t.index ["group_num"], name: "index_groups_on_group_num", using: :btree
    t.index ["server_id"], name: "index_groups_on_server_id", using: :btree
  end

  create_table "pet_aliases", force: :cascade do |t|
    t.integer "pet_id",    null: false
    t.string  "alias"
    t.integer "server_id"
    t.index ["pet_id"], name: "index_pet_aliases_on_pet_id", using: :btree
  end

  create_table "pet_serendipities", force: :cascade do |t|
    t.datetime "trigger_time",                   null: false
    t.bigint   "reporter",     default: 5499174, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "pet_id",                         null: false
    t.integer  "server_id",                      null: false
    t.index ["pet_id"], name: "index_pet_serendipities_on_pet_id", using: :btree
    t.index ["server_id"], name: "index_pet_serendipities_on_server_id", using: :btree
  end

  create_table "pets", force: :cascade do |t|
    t.string  "name",   null: false
    t.integer "min_cd", null: false
    t.integer "max_cd", null: false
    t.string  "guide"
  end

  create_table "serendipities", force: :cascade do |t|
    t.string  "name", null: false
    t.integer "cd"
  end

  create_table "servers", force: :cascade do |t|
    t.string  "name",             null: false
    t.string  "region",           null: false
    t.integer "source_server_id"
    t.string  "ip",               null: false
    t.integer "port",             null: false
    t.index ["name"], name: "index_servers_on_name", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "group_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
