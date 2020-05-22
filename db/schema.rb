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

ActiveRecord::Schema.define(version: 2020_05_22_182651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lobbies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_messages_on_session_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "money", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.string "checkout_session_id"
    t.bigint "user_id"
    t.bigint "topup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topup_id"], name: "index_orders_on_topup_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "lobby_id"
    t.bigint "user_id"
    t.integer "price"
    t.integer "win_price", default: 0
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "star_level", default: "Any"
    t.string "team_type", default: "Any"
    t.string "half_length", default: "6 min"
    t.string "legacy_depending", default: "Not allowed"
    t.text "custom_rules", default: ""
    t.string "match_type", default: "Single game"
    t.string "status", default: "pending"
    t.string "winner"
    t.integer "score1", default: 0
    t.integer "score2", default: 0
    t.string "scoresub"
    t.index ["lobby_id"], name: "index_sessions_on_lobby_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "topups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
  end

  create_table "user_invites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending"
    t.string "friend_added"
    t.index ["session_id"], name: "index_user_invites_on_session_id"
    t.index ["user_id"], name: "index_user_invites_on_user_id"
  end

  create_table "user_lobbies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lobby_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lobby_id"], name: "index_user_lobbies_on_lobby_id"
    t.index ["user_id"], name: "index_user_lobbies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "wallet"
    t.string "location"
    t.string "psn"
    t.string "xboxlive"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "sessions"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "topups"
  add_foreign_key "orders", "users"
  add_foreign_key "sessions", "lobbies"
  add_foreign_key "sessions", "users"
  add_foreign_key "user_invites", "sessions"
  add_foreign_key "user_invites", "users"
  add_foreign_key "user_lobbies", "lobbies"
  add_foreign_key "user_lobbies", "users"
end
