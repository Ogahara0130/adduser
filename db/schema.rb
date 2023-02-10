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

ActiveRecord::Schema[7.0].define(version: 2022_10_28_004527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userinfos", force: :cascade do |t|
    t.string "name_first"
    t.string "name_last"
    t.string "name_first_read"
    t.string "name_last_read"
    t.string "sex"
    t.date "birthday"
    t.string "postnumber"
    t.string "prefecture"
    t.string "municipalities"
    t.string "street"
    t.string "tel_main"
    t.string "tel_selpfhone"
    t.string "mail_pc"
    t.string "mail_pass"
    t.string "survey_experience"
    t.boolean "traffic_survey"
    t.boolean "driving_survey"
    t.boolean "bus_survey"
    t.boolean "questionnaire_distribution"
    t.boolean "interview_survey"
    t.boolean "visit_survey"
    t.boolean "undercover_investigation"
    t.boolean "office_staff"
    t.string "nearest_office"
    t.string "possession_car"
    t.string "nearest_station"
    t.string "cognitive_pathway"
    t.string "cognitive_pathway_other"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
