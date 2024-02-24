class CreateSurveyResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_responses do |t|
      t.integer :survey_number
      t.string :gender
      t.string :age_group
      t.integer :years_of_service
      t.integer :absent_days
      t.integer :days_with_symptoms
      t.integer :task_volume_completion_level
      t.integer :task_quality_level
      t.references :company, foreign_key: true
      t.references :department, foreign_key: true
      t.references :industry, null: false
      t.references :job_function, foreign_key: true
      t.references :employment_type, null: false

      t.timestamps
    end
  end
end
