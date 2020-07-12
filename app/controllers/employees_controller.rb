class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end

  def create
    company = Company.find(params[:company_id])
    company.employees.create(employee_params)
  end

  private

    def employee_params
      params.require(:employee).permit(:name, :title)
    end
end
