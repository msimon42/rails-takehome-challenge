class CompanyOfficesController < ApplicationController
  def new
    @company_id = params[:company_id]
    @available_offices = OfficeDropdownFacade.prepare_for_dropdown(Office.available)
  end

  def create
    office = Office.find(params[:office])
    office.update(company_id: params[:company_id])
    flash[:success] = 'Office successfully added'
    redirect_to company_path(params[:company_id])
  end
end
