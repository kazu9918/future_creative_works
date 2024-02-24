class CreateHealthConditionResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :health_condition_responses do |t|
      t.boolean :is_most_impactful
      t.references :survey_response, null: false, foreign_key: true
      t.references :health_condition, null: false

      t.timestamps
    end
  end
end
