class CompaniesController < ApplicationController
  def index
    @Company = Company.all
  end

  def new
    @company = Company.new
  end

  def create

    @company = Company.new(company_params)
    
    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def survey_analysis
    @data = [['2019-06-01', 100], ['2019-06-02', 200], ['2019-06-03', 150]]
  end

  private
  # ストロングパラメーターを使用して、許可されたパラメータのみを取り扱います。
  def company_params
    params.require(:company).permit(:company_name, :number_of_employees, :industry_category, departments_attributes: [:department_name], job_functions_attributes: [:description])
  end

end