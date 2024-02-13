class Company < ApplicationRecord
    belongs_to :industry
    has_many :departments
    has_many :job_functions

    delegate :industry_category, to: :industry, prefix: true

end
