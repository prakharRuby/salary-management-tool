require "rails_helper"

RSpec.describe "Employees", type: :request do
  it "creates employee" do
    post "/employees", params: {
      employee: {
        full_name: "John Doe",
        job_title: "Manager",
        country: "USA",
        salary: 70000
      }
    }

    expect(response.status).to eq(201)
    expect(Employee.count).to eq(1)
  end
end