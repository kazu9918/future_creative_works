class CreateSurveyResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_responses do |t|

      t.references :company, foreign_key: true
      t.references :employment_type, foreign_key: true

      # Add other columns as needed

      t.timestamps
    end
  end
end
