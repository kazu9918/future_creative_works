# app/controllers/survey_responses_controller.rb

class SurveyResponsesController < ApplicationController
  def new
    @survey_response = SurveyResponse.new
    # 必要なビューロジックを追加する場合はここに追加
  end

  def create
    @survey_response = SurveyResponse.new(survey_response_params)
    if @survey_response.save
      flash[:success] = "アンケートが送信されました。"
      redirect_to root_path
# 　　　アンケートご協力感謝画面に遷移するよう変更が必要
    else
      flash[:error] = "アンケートの送信中にエラーが発生しました。"
      render :new
    end
  end

  private

  def survey_response_params
    params.require(:survey_response).permit(:gender, :age_group, :years_of_service, :response_date, :days_with_symptoms, :task_volume_completion_level, :task_quality_level, :company_id, :department_id, :employment_type_id, :job_function_id)
  end
end
