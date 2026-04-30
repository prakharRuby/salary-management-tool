class Employee < ApplicationRecord
  validates :full_name, :job_title, :country, :salary, presence: true
  validates :email, uniqueness: true, allow_blank: true
end