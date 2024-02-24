class Company < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    validates :name, presence: true

    has_many :departments, dependent: :destroy
    has_many :job_functions, dependent: :destroy
    has_many :survey_responses
    belongs_to_active_hash :industry

    accepts_nested_attributes_for :departments, allow_destroy: true
    accepts_nested_attributes_for :job_functions, allow_destroy: true

    def total_absenteeism
        survey_responses.sum(&:absenteeism)
    end

    def total_presenteeism
        survey_responses.sum(&:presenteeism)
    end

    def total_productivity_loss
        survey_responses.sum(&:calculate_productivity_loss)
    end

    def health_condition_response_counts
        health_condition_response_counts = HealthConditionResponse.joins(survey_response: :company)
                                                                .where(survey_responses: { company_id: company_id })
                                                                .group(:health_condition_id)
                                                                .count
    end
end
