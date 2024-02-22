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
  end

  def survey_analysis
    @data = [['2019-06-01', 100], ['2019-06-02', 200], ['2019-06-03', 150]]
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
