# Salary Management Tool

## Overview

A minimal yet production-minded salary management application built for an organization with 10,000 employees. The system enables HR managers to manage employee records and view salary insights across countries and job titles.

## Features

### Employee Management

* Add employee
* View employee list
* Update employee
* Delete employee
* Search employees
* Pagination for large datasets

### Salary Insights

* Minimum salary by country
* Maximum salary by country
* Average salary by country
* Average salary for a selected job title in a selected country
* Total employee count

## Tech Stack

### Backend

* Ruby on Rails (API mode)
* SQLite

### Frontend

* React
* JavaScript
* Vite

### Testing

* RSpec

## Architecture

```text
React Frontend
     ↓ REST API
Rails Backend
     ↓
SQLite Database
```

## Setup Instructions

### Backend

```bash
cd salary_backend
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s
```

### Frontend

```bash
cd salary_frontend
npm install
npm run dev
```

## Seeding Strategy

The system seeds 10,000 employees using bulk insert for performance.

Used:

* `insert_all`

Why:

* Faster than creating records one by one
* Suitable for repeated local setup by engineers

## API Endpoints

### Employees

* `GET /employees`
* `POST /employees`
* `PUT /employees/:id`
* `DELETE /employees/:id`

### Insights

* `GET /insights`
* `GET /insights?country=India`
* `GET /insights?country=India&job_title=Engineer`

## Testing

Run backend tests:

```bash
bundle exec rspec
```

## Product Decisions

### Why JavaScript Instead of TypeScript?

For this time-boxed assessment, JavaScript was chosen to optimize development speed while keeping the code modular and maintainable.

### Why Client-side Pagination?

Fast to implement for the assessment and provides a smooth UX for 10,000 records in the browser.

### Why Modal for Add/Edit?

Keeps the dashboard clean and improves usability.

## AI Usage

AI tools were used intentionally for:

* Scaffolding boilerplate code
* UI iteration
* Refactoring
* Debugging issues
* Test generation ideas
* Improving delivery speed

All generated output was reviewed, modified, and validated manually.

## Future Improvements

* Server-side pagination
* Sorting
* Authentication / RBAC
* Export CSV
* Charts and trends
* Better test coverage
* Toast notifications
* Advanced filters

## Deployment

* Frontend URL: Add your deployed link
* Backend URL: Add your deployed link

## Demo

* Add Loom / screen recording link here

## Author

Prakhar Srivastava
