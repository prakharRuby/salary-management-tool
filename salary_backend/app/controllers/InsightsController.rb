class InsightsController < ApplicationController
  def index
    country = params[:country]
    job_title = params[:job_title]

    scope = Employee.all
    scope = scope.where(country: country) if country.present?

    data = {
      total_employees: scope.count,
      min_salary: scope.minimum(:salary),
      max_salary: scope.maximum(:salary),
      avg_salary: scope.average(:salary).to_f.round(2)
    }

    if country.present? && job_title.present?
      job_scope = Employee.where(country: country, job_title: job_title)

      data[:job_title_avg_salary] =
        job_scope.average(:salary).to_f.round(2)
    end

    render json: data
  end
end