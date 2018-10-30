
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181030162714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academics", force: :cascade do |t|
    t.string "schoolName"
    t.string "phone"
    t.string "satMath"
    t.string "satEnglish"
    t.string "satTotal"
    t.string "actTotal"
    t.string "gpa"
    t.string "gpaScale"
    t.string "classRank"
    t.string "classSize"
    t.text "notes"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_academics_on_athlete_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_addresses_on_athlete_id"
  end

  create_table "athletes", force: :cascade do |t|
    t.string "firstName"
    t.string "middleName"
    t.string "lastName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "preferredName"
    t.string "yearStartingSchool"
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_athletes_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_contacts_on_athlete_id"
  end

  create_table "counselor_contacts", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "phone"
    t.string "email"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_counselor_contacts_on_athlete_id"
  end

  create_table "current_addresses", force: :cascade do |t|
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_current_addresses_on_athlete_id"
  end

  create_table "father_addresses", force: :cascade do |t|
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_father_addresses_on_athlete_id"
  end

  create_table "father_contacts", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "phone"
    t.string "email"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_father_contacts_on_athlete_id"
  end

  create_table "mother_addresses", force: :cascade do |t|
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_mother_addresses_on_athlete_id"
  end

  create_table "mother_contacts", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "phone"
    t.string "email"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_mother_contacts_on_athlete_id"
  end

  create_table "school_addresses", force: :cascade do |t|
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_school_addresses_on_athlete_id"
  end

  create_table "siblings", force: :cascade do |t|
    t.text "siblingNames"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_siblings_on_athlete_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "sportName"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.boolean "startSportData", default: false
    t.index ["athlete_id"], name: "index_sports_on_athlete_id"
  end

  create_table "swimmings", force: :cascade do |t|
    t.string "frSCY50"
    t.string "frSCM50"
    t.string "frLCM50"
    t.string "frSCY100"
    t.string "frSCM100"
    t.string "frLCM100"
    t.string "frSCY200"
    t.string "frSCM200"
    t.string "frLCM200"
    t.string "frSCY500"
    t.string "frSCM400"
    t.string "frLCM400"
    t.string "frSCY1000"
    t.string "frSCM800"
    t.string "frLCM800"
    t.string "frSCY1650"
    t.string "frSCM1500"
    t.string "frLCM1500"
    t.string "bkSCY50"
    t.string "bkSCM50"
    t.string "bkLCM50"
    t.string "bkSCY100"
    t.string "bkSCM100"
    t.string "bkLCM100"
    t.string "bkSCY200"
    t.string "bkSCM200"
    t.string "bkLCM200"
    t.string "brSCY50"
    t.string "brSCM50"
    t.string "brLCM50"
    t.string "brSCY100"
    t.string "brSCM100"
    t.string "brLCM100"
    t.string "brSCY200"
    t.string "brSCM200"
    t.string "brLCM200"
    t.string "flSCY50"
    t.string "flSCM50"
    t.string "flLCM50"
    t.string "flSCY100"
    t.string "flSCM100"
    t.string "flLCM100"
    t.string "flSCY200"
    t.string "flSCM200"
    t.string "flLCM200"
    t.string "imSCY100"
    t.string "imSCM100"
    t.string "imSCY200"
    t.string "imSCM200"
    t.string "imLCM200"
    t.string "imSCY400"
    t.string "imSCM400"
    t.string "imLCM400"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_swimmings_on_sport_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstName"
    t.string "lastName"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "academics", "athletes"
  add_foreign_key "addresses", "athletes"
  add_foreign_key "contacts", "athletes"
  add_foreign_key "counselor_contacts", "athletes"
  add_foreign_key "current_addresses", "athletes"
  add_foreign_key "father_addresses", "athletes"
  add_foreign_key "father_contacts", "athletes"
  add_foreign_key "mother_addresses", "athletes"
  add_foreign_key "mother_contacts", "athletes"
  add_foreign_key "school_addresses", "athletes"
  add_foreign_key "siblings", "athletes"
  add_foreign_key "sports", "athletes"
  add_foreign_key "swimmings", "sports"
end
