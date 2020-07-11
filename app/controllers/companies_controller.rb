class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def create

  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
