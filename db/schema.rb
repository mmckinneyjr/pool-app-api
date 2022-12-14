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

ActiveRecord::Schema[7.0].define(version: 2022_09_02_190714) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "standings", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
    t.integer "bracket_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round"
    t.boolean "win"
  end

  create_table "tournaments", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.string "venue_name"
    t.string "street_address"
    t.string "state"
    t.string "city"
    t.integer "zipcode"
    t.integer "admin_user_id"
    t.text "details"
    t.string "tournament_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.integer "games_won"
    t.integer "games_lost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
