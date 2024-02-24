# app/controllers/survey_responses_controller.rb

class SurveyResponsesController < ApplicationController
  def new
    @survey_response = SurveyResponse.new
    @company = Company.find(params[:company_id])
    @departments = @company.departments.all
    @jobFunctions = @company.job_functions.all
    @employment_type = EmploymentType.all
    @health_conditions = HealthCondition.all
  end

  def create
    @survey_response = SurveyResponse.new(survey_response_params)
    if @survey_response.save
      flash[:success] = "アンケートが送信されました。"
      redirect_to root_path
    else
      flash[:error] = "アンケートの送信中にエラーが発生しました。"
      redirect_to new_company_survey_response_path(@company)
    end
  end

  private

  def survey_response_params
    params.require(:survey_response).permit(
      :survey_number,
      :gender,
      :age_group,
      :years_of_service,
      :days_with_symptoms,
      :task_volume_completion_level,
      :task_quality_level,
      :absent_days,
      :company_id,
      :department_id,
      :employment_type_id,
      :job_function_id,
      health_condition_responses_attributes: [:id, :is_most_impactful, :health_condition_id]
    )
  end
end
