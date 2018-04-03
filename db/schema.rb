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

ActiveRecord::Schema.define(version: 20180403062715) do

  create_table "badges", force: :cascade do |t|
    t.string "image"
    t.integer "user_id"
    t.string "condition"
    t.string "score"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_badges_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.decimal "reputation"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "visit_count"
    t.index ["country_id"], name: "index_companies_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drug_categories", force: :cascade do |t|
    t.integer "drug_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_drug_categories_on_category_id"
    t.index ["drug_id"], name: "index_drug_categories_on_drug_id"
  end

  create_table "drug_generics", force: :cascade do |t|
    t.integer "drug_id"
    t.integer "generic_id"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "concentration"
    t.index ["drug_id"], name: "index_drug_generics_on_drug_id"
    t.index [nil], name: "index_drug_generics_on_category_id"
  end

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "company_id"
    t.integer "country_id"
    t.integer "form_id"
    t.boolean "market_available", default: true
    t.text "professional_comment", default: "Please share your professional comment about this drug with us."
    t.datetime "invented_at", default: "2008-04-01 22:11:21"
    t.string "market_status", default: "patent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", default: "drug.png"
    t.integer "visit_count", default: 0, null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", default: "generic.png"
    t.integer "visit_count", default: 0, null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.integer "first_drug"
    t.integer "second_drug"
    t.string "title"
    t.text "description"
    t.string "level"
    t.boolean "is_deadly"
    t.string "avoid_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", default: "interaction.png"
    t.index ["first_drug"], name: "index_interactions_on_first_drug"
    t.index ["second_drug"], name: "index_interactions_on_second_drug"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "mobile_phone", null: false
    t.string "land_line"
    t.string "address"
    t.integer "age", default: 24, null: false
    t.string "gender", default: "Male", null: false
    t.string "profession", default: "Physician", null: false
    t.integer "level", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified", default: false, null: false
    t.decimal "reputation"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "rx_items", force: :cascade do |t|
    t.integer "drug_id"
    t.integer "rx_id"
    t.decimal "quantity"
    t.decimal "concentration"
    t.string "duration"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_rx_items_on_drug_id"
    t.index ["rx_id"], name: "index_rx_items_on_rx_id"
  end

  create_table "rxes", force: :cascade do |t|
    t.datetime "expires_at"
    t.decimal "total_value"
    t.integer "dispensed_count"
    t.integer "patient_id"
    t.integer "dispenser_id"
    t.integer "issuer_id"
    t.string "short_diagnosis"
    t.text "full_diagnosis"
    t.integer "allowed_dispense_count"
    t.string "status"
    t.string "visibility"
    t.string "picture"
    t.boolean "expired"
    t.text "professional_comment"
    t.datetime "starts_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", default: "rx.png"
    t.string "password", default: "2018", null: false
    t.index ["issuer_id"], name: "index_rxes_on_issuer_id"
    t.index ["patient_id"], name: "index_rxes_on_patient_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "username"
    t.string "type"
    t.boolean "verified"
    t.decimal "reputation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
