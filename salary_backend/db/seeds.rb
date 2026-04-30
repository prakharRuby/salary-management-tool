# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
first_names = %w[John Jane Rahul Amit Sara Priya David Maria Alex Chris]
last_names  = %w[Smith Kumar Sharma Patel Brown Singh Khan Lee Roy Das]

jobs = ["Engineer", "Manager", "HR", "Designer", "Analyst"]
countries = ["India", "USA", "UK", "Canada", "Germany"]
departments = ["Tech", "HR", "Finance", "Design"]

records = []

10000.times do |i|
  records << {
    full_name: "#{first_names.sample} #{last_names.sample}",
    email: "user#{i}@test.com",
    job_title: jobs.sample,
    country: countries.sample,
    salary: rand(30000..150000),
    department: departments.sample,
    hire_date: rand(1..1000).days.ago,
    status: "Active",
    created_at: Time.now,
    updated_at: Time.now
  }
end

Employee.insert_all(records)
puts "Seeded 10,000 employees"