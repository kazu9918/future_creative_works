class Department < ApplicationRecord
  attribute :name, :string
  belongs_to :company, foreign_key: "company_id", optional: true
end
