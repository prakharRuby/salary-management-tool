require "rails_helper"

RSpec.describe "Insights", type: :request do
  before do
    Employee.create!(
      full_name: "A",
      job_title: "Engineer",
      country: "India",
      salary: 40000
    )

    Employee.create!(
      full_name: "B",
      job_title: "Engineer",
      country: "India",
      salary: 60000
    )
  end

  it "returns country salary insights" do
    get "/insights", params: { country: "India" }

    json = JSON.parse(response.body)

    expect(json["min_salary"]).to eq("40000.0")
    expect(json["max_salary"]).to eq("60000.0")
  end
end