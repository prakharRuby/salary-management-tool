require "rails_helper"

RSpec.describe Employee, type: :model do
  it "is valid with required fields" do
    employee = Employee.new(
      full_name: "Rahul Sharma",
      job_title: "Engineer",
      country: "India",
      salary: 50000
    )

    expect(employee.valid?).to eq(true)
  end

  it "is invalid without full_name" do
    employee = Employee.new(
      job_title: "Engineer",
      country: "India",
      salary: 50000
    )

    expect(employee.valid?).to eq(false)
  end
end