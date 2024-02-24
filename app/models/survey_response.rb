class SurveyResponse < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :health_condition_responses
  belongs_to :company
  belongs_to :department
  belongs_to :job_function
  belongs_to_active_hash :employment_type

  enum age_group: {
    under_teen: 0,
    twenties: 1,
    thirties: 2,
    forties: 3,
    fifties: 4,
    sixties_and_over: 5
  }

  validates :task_volume_completion_level, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :task_volume_completion_level, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  accepts_nested_attributes_for :health_condition_responses, allow_destroy: true

  def health_condition_ids
    health_condition_responses.map(&:health_condition_id)
  end

  def health_condition_ids=(ids)
    self.health_condition_responses = ids.compact.reject(&:blank?).map do |id|
      health_condition_response = health_condition_responses.find_or_initialize_by(health_condition_id: id)
      health_condition_response
    end
  end

  def presenteeism
    task_volume = self.task_volume_completion_level.to_f / 10
    task_quality = self.task_quality_level.to_f / 10

    presenteeism_score = (1 - task_volume * task_quality) * self.days_with_symptoms.to_f * 20 / 28 * 10000 * 12

    presenteeism_score.floor
  end

  def absenteeism
    absenteeism_score = self.absent_days * 10000
    absenteeism_score
  end

  def calculate_productivity_loss
    presenteeism + absenteeism
  end
end
