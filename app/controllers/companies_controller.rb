class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    company = Company.create(company_params)
    if company.save
      office = Office.find(params[:office])
      company.offices << office
      flash[:success] = "#{company.name} successfully created!"
      redirect_to company_path(company.id)
    else
      flash[:danger] = company.errors.full_messages.to_sentence
      redirect_back fallback_location: new_company_path
    end
  end

  def new
    @available_offices = OfficeDropdownFacade.prepare_for_dropdown(Office.available)
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy
    flash[:success] = "#{company.name} removed from system."
    redirect_to companies_path
  end

  private

  def company_params
    params.permit(:name)
  end
end
