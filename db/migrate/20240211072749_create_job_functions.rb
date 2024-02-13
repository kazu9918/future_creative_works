class CreateJobFunctions < ActiveRecord::Migration[7.0]
  def change
    create_table :job_functions do |t|
      t.string :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
