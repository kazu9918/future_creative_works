class Department < ApplicationRecord
  belongs_to :company, foreign_key: "company_id"
end
