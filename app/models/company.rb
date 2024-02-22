class Company < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    validates :name, presence: true
    
    has_many :departments
    has_many :job_functions
    has_many :survey_responses
    belongs_to_active_hash :industry

    delegate :industry_id, to: :industry, prefix: true

    accepts_nested_attributes_for :departments, allow_destroy: true
    accepts_nested_attributes_for :job_functions, allow_destroy: true
end
