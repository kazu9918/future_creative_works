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

ActiveRecord::Schema[7.0].define(version: 2024_02_22_130846) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_employees"
    t.integer "industry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_companies_on_industry_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "health_condition_responses", force: :cascade do |t|
    t.boolean "is_most_impactful"
    t.integer "survey_response_id", null: false
    t.integer "health_condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_condition_id"], name: "index_health_condition_responses_on_health_condition_id"
    t.index ["survey_response_id"], name: "index_health_condition_responses_on_survey_response_id"
  end

  create_table "job_functions", force: :cascade do |t|
    t.string "description"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_job_functions_on_company_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.integer "survey_number"
    t.string "gender"
    t.string "age_group"
    t.integer "years_of_service"
    t.integer "absent_days"
    t.integer "days_with_symptoms"
    t.integer "task_volume_completion_level"
    t.integer "task_quality_level"
    t.integer "company_id"
    t.integer "department_id"
    t.integer "industry_id", null: false
    t.integer "job_function_id"
    t.integer "employment_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_survey_responses_on_company_id"
    t.index ["department_id"], name: "index_survey_responses_on_department_id"
    t.index ["employment_type_id"], name: "index_survey_responses_on_employment_type_id"
    t.index ["industry_id"], name: "index_survey_responses_on_industry_id"
    t.index ["job_function_id"], name: "index_survey_responses_on_job_function_id"
  end

  add_foreign_key "departments", "companies"
  add_foreign_key "health_condition_responses", "survey_responses"
  add_foreign_key "job_functions", "companies"
  add_foreign_key "survey_responses", "companies"
  add_foreign_key "survey_responses", "departments"
  add_foreign_key "survey_responses", "job_functions"
end
