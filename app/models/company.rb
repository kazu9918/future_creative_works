class Company < ApplicationRecord
    validates :name, presence: true
    belongs_to :industry, class_name: 'Industry'
    has_many :departments
    has_many :job_functions
    has_many :survey_responses

    delegate :industry_id, to: :industry, prefix: true

    accepts_nested_attributes_for :departments, :job_functions

end
