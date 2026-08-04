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

ActiveRecord::Schema[8.1].define(version: 2026_08_04_170928) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "parent_child_relationships", force: :cascade do |t|
    t.bigint "child_id", null: false
    t.datetime "created_at", null: false
    t.bigint "parent_id", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_parent_child_relationships_on_child_id"
    t.index ["parent_id", "child_id"], name: "index_parent_child_relationships_on_parent_id_and_child_id", unique: true
    t.index ["parent_id"], name: "index_parent_child_relationships_on_parent_id"
  end

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

  create_table "person_place_associations", force: :cascade do |t|
    t.string "association_type", null: false
    t.datetime "created_at", null: false
    t.bigint "person_id", null: false
    t.bigint "place_id", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id", "place_id", "association_type"], name: "index_person_place_associations_on_identity", unique: true
    t.index ["person_id"], name: "index_person_place_associations_on_person_id"
    t.index ["place_id"], name: "index_person_place_associations_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "alternate_names", default: [], array: true
    t.datetime "created_at", null: false
    t.string "preferred_name", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible", default: true, null: false
    t.index ["preferred_name"], name: "index_places_on_preferred_name"
  end

  create_table "work_contributions", force: :cascade do |t|
    t.string "contribution_role", null: false
    t.datetime "created_at", null: false
    t.bigint "person_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "work_id", null: false
    t.index ["person_id", "work_id", "contribution_role"], name: "index_work_contributions_on_identity", unique: true
    t.index ["person_id"], name: "index_work_contributions_on_person_id"
    t.index ["work_id"], name: "index_work_contributions_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "alternate_titles", default: [], array: true
    t.datetime "created_at", null: false
    t.string "preferred_title", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible", default: true
    t.index ["preferred_title"], name: "index_works_on_preferred_title"
  end

  add_foreign_key "parent_child_relationships", "people", column: "child_id"
  add_foreign_key "parent_child_relationships", "people", column: "parent_id"
  add_foreign_key "person_place_associations", "people"
  add_foreign_key "person_place_associations", "places"
  add_foreign_key "work_contributions", "people"
  add_foreign_key "work_contributions", "works"
end
