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

ActiveRecord::Schema.define(version: 20170219220435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "redeem_rewards", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "points"
    t.index ["reward_id"], name: "index_redeem_rewards_on_reward_id", using: :btree
    t.index ["user_id"], name: "index_redeem_rewards_on_user_id", using: :btree
  end

  create_table "reward_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_id"
    t.index ["reward_id"], name: "index_reward_favorites_on_reward_id", using: :btree
    t.index ["user_id"], name: "index_reward_favorites_on_user_id", using: :btree
  end

  create_table "rewards", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "status",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.integer  "role",            default: 1
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "redeem_rewards", "rewards"
  add_foreign_key "redeem_rewards", "users"
  add_foreign_key "reward_favorites", "rewards"
  add_foreign_key "reward_favorites", "users"
end
