class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :number_of_employees 

      t.references :industry, null: false

      t.timestamps
    end
  end
end
