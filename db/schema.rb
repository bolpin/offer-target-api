# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_28_174338) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string "model"
    t.integer "os_major_version"
    t.integer "os_minor_version"
    t.integer "os_patch_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.bigint "operating_system_id"
    t.bigint "locale_id"
    t.index ["locale_id"], name: "index_devices_on_locale_id"
    t.index ["operating_system_id"], name: "index_devices_on_operating_system_id"
    t.index ["player_id"], name: "index_devices_on_player_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locales", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_targets", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.integer "min_player_age"
    t.integer "max_player_age"
    t.bigint "operating_system_id", null: false
    t.integer "min_os_major_version"
    t.integer "min_os_minor_version"
    t.integer "min_os_patch_version"
    t.bigint "locale_id", null: false
    t.bigint "gender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender_id"], name: "index_offer_targets_on_gender_id"
    t.index ["locale_id"], name: "index_offer_targets_on_locale_id"
    t.index ["offer_id"], name: "index_offer_targets_on_offer_id"
    t.index ["operating_system_id"], name: "index_offer_targets_on_operating_system_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "header"
    t.text "description"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payout_cents", default: 0, null: false
    t.string "payout_currency", default: "USD", null: false
  end

  create_table "operating_systems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gender_id"
    t.index ["gender_id"], name: "index_players_on_gender_id"
  end

end
