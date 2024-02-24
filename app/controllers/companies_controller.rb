class CompaniesController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index
    @companies = Company.all
    @industries = Industry.all
  end

  def new
    @company = Company.new
    @industries = Industry.all
  end

  def create
    @company = Company.new(company_params)
    
    if @company.save
      redirect_to companies_path, notice: 'Company was successfully created.'
    else
      render :new
    end

  end

  def edit
    @company = Company.find(params[:id])
    @industries = Industry.all
    @departments = @company.departments.all
    @jobFunctions = @company.job_functions.all
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to companies_path, notice: '企業情報が正常に更新されました。'
    else
      @industries = Industry.all # エラー時に再度業界リストをロード
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      redirect_to companies_path, notice: '企業が正常に削除されました。'
    else
      redirect_to companies_path, alert: '企業の削除に失敗しました。'
    end
  end

  def survey_analysis
    @company = Company.find(params[:id])
    @departments = @company.departments.all
    @jobFunctions = @company.job_functions.all
    @employment_types = EmploymentType.all
    @symptoms = [['腰痛', 5],['頭痛（偏頭痛や慢...', 4], ['睡眠に関する不調...', 2], ['アレルギーによる...', 1], ['その他不調など', 1]]
  end

  private

  def company_params
    params.require(:company).permit(
      :name, 
      :number_of_employees, 
      :industry_id, 
      departments_attributes: [:id, :name, :_destroy],
      job_functions_attributes: [:id, :description, :_destroy]
    )
  end
end
