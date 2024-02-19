class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.integer :number_of_employees 

      t.references :industry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
