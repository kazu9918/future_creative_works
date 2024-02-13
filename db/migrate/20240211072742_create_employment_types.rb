class CreateEmploymentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_types do |t|
      t.string :employment_types_name

      t.timestamps
    end
  end
end
