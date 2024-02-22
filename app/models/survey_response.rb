class SurveyResponse < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :company
  belongs_to :department
  belongs_to_active_hash :employment_type
  belongs_to :job_function

  delegate :department_id, to: :department, prefix: true
  delegate :employment_type_id, to: :employment_type, prefix: true
  delegate :job_function_id, to: :job_function, prefix: true

end
