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

ActiveRecord::Schema[7.0].define(version: 2024_02_15_125436) do
  create_table "companies", force: :cascade do |t|
    t.integer "company_id"
    t.string "company_name"
    t.integer "number_of_employees"
    t.integer "industry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["company_id"], name: "index_companies_on_company_id", unique: true
    t.index ["industry_id"], name: "index_companies_on_industry_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "employment_types", force: :cascade do |t|
    t.integer "employment_types_id"
    t.string "employment_types_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.integer "industry_id"
    t.string "industry_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_functions", force: :cascade do |t|
    t.integer "job_functions_id"
    t.string "description"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_job_functions_on_company_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.integer "company_id"
    t.integer "employment_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_survey_responses_on_company_id"
    t.index ["employment_type_id"], name: "index_survey_responses_on_employment_type_id"
  end

  add_foreign_key "companies", "industries"
  add_foreign_key "departments", "companies"
  add_foreign_key "job_functions", "companies"
  add_foreign_key "survey_responses", "companies"
  add_foreign_key "survey_responses", "employment_types"
end
