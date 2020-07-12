class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end

  def new
    company = Company.find(params[:company_id])
    @offices = OfficeDropdownFacade.prepare_for_dropdown(company.offices)
  end

  def create
    company = Company.find(params[:company_id])
    employee = company.employees.create(employee_params)
    employee.office_id = params[:office]
    if employee.save
      flash[:success] = "#{employee.name} added to #{company.name}"
      redirect_to company_path(params[:company_id])
    else
      flash[:danger] = employee.errors.full_messages.to_sentence
      redirect_back fallback_location: new_company_employee_path
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    flash[:success] = "#{employee.name} removed from system."
    redirect_to company_path(params[:company_id])
  end

  private

    def employee_params
      params.permit(:name, :title)
    end
end
