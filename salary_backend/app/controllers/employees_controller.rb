class EmployeesController < ApplicationController

  def index
    employees = Employee.order(id: :desc)
    render json: employees
  end

  def show
     @employee = Employee.find_by(id:params[:id])
    render json: @employee
  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee, status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @employee = Employee.find_by(id:params[:id])
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find_by(id:params[:id])
    @employee.destroy
    head :no_content
  end

  private

  def employee_params
    params.require(:employee).permit(:full_name, :email, :job_title, :country, :salary, :department, :hire_date, :status)
  end
end