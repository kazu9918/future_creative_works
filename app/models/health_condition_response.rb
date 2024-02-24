class HealthConditionResponse < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :survey_response
  belongs_to_active_hash :health_condition
end
