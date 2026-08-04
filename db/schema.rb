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

ActiveRecord::Schema[8.1].define(version: 2026_08_04_100626) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "people", force: :cascade do |t|
    t.string "alternate_family_names", default: [], array: true
    t.string "alternate_given_names", default: [], array: true
    t.datetime "created_at", null: false
    t.string "preferred_family_name"
    t.string "preferred_given_name"
    t.string "sex", default: "unknown", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible"
  end

  create_table "places", force: :cascade do |t|
    t.string "alternate_names", default: [], array: true
    t.datetime "created_at", null: false
    t.string "preferred_name", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible", default: true, null: false
    t.index ["preferred_name"], name: "index_places_on_preferred_name"
  end
end
