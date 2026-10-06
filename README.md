# Dance Away

A web application for managing dance classes, lessons and student bookings, built with Ruby on Rails.

The application allows students to browse available lessons and book places, while teachers and administrators have dedicated functionality for managing lessons, teacher applications and users.

## Features

### Students

* Browse available dance lessons
* View lesson details, including:

  * dance style
  * teacher
  * date and time
  * capacity
  * available places
* Book a lesson
* Cancel a booking
* Prevent booking the same lesson more than once
* Prevent booking lessons that overlap in time
* View lessons in list or calendar view
* Change application language

### Teachers

* Apply to teach available lessons
* View submitted teacher applications
* Teacher applications can be accepted or rejected by an administrator

### Administrators

* Manage users
* Assign and manage user roles
* Create, edit and delete lessons
* Manage lesson capacity and teachers
* View lesson participants
* Accept or reject teacher applications
* Change the teacher assigned to a lesson

## Architecture

The application follows a conventional Rails MVC architecture.

### Main domain models

```text
User
 ├── Roles
 ├── Bookings
 ├── Teaching Lessons
 └── Teacher Applications

Lesson
 ├── Dance Class
 ├── Teacher
 ├── Bookings
 └── Teacher Applications

Dance Class
 └── Dance Style

Booking
 ├── Student (User)
 └── Lesson

Teacher Application
 ├── Teacher (User)
 └── Lesson
```

Users can have multiple roles through the `UserRole` join model:

```text
User ←→ UserRole ←→ Role
```

Available roles are:

* `student`
* `teacher`
* `admin`

## Testing

The project uses RSpec with FactoryBot.

Run the test suite with:

```bash
bundle exec rspec
```

Code style is checked with RuboCop:

```bash
bundle exec rubocop
```

Security analysis:

```bash
bundle exec brakeman
```

Importmap dependency audit:

```bash
bin/importmap audit
```

## Requirements

* Ruby 3.4+
* PostgreSQL
* Bundler

Check the project's `.ruby-version` file for the exact Ruby version used by the application.

## Local Setup

Clone the repository:

```bash
git clone https://github.com/zo4564/dance_away.git
cd dance_away
```

Install dependencies:

```bash
bundle install
```

Create and prepare the database:

```bash
bin/rails db:prepare
```

Run the application:

```bash
bin/rails server
```

The application will be available at:

```text
http://localhost:3000
```

## Demo Data

The project contains seed data for local development.

To recreate the development database with sample data:

```bash
bin/rails db:seed
```

The seed data creates example users, roles, dance classes, lessons and bookings.

> Demo credentials are intended for local development only and must not be used as real production credentials.

## Screenshots - demo

### Landing page

<img width="1214" height="601" alt="image" src="https://github.com/user-attachments/assets/2b19d205-f284-41e8-975f-b6b7a915244a" />

### Admin panel - lessons

<img width="1203" height="600" alt="image" src="https://github.com/user-attachments/assets/2917a1ea-c4d5-4bef-a359-30dc49ee0dc9" />

### Admin panel - users list

<img width="1217" height="576" alt="image" src="https://github.com/user-attachments/assets/da733106-21d4-4f20-915d-d9785bf86619" />

### Lessons list for teachers

<img width="1272" height="603" alt="image" src="https://github.com/user-attachments/assets/249906c9-481a-4017-b20e-8d3a424c1ce7" />

### Lessons calendar for teachers

<img width="1240" height="606" alt="image" src="https://github.com/user-attachments/assets/4057a5ab-205f-4e0a-8d82-17944d8dd7a3" />

### Teacher applications

<img width="1237" height="600" alt="image" src="https://github.com/user-attachments/assets/44e7cc72-a794-4056-ba64-8f35e169357d" />

### Dance styles

<img width="1227" height="603" alt="image" src="https://github.com/user-attachments/assets/04f78e8c-f24c-4ff3-a90a-9e5e6fd5d09b" />

### Lesson details for user

<img width="1171" height="603" alt="image" src="https://github.com/user-attachments/assets/a4765a74-d10f-446e-bc0f-dee0ebe51898" />

### Users lessons - calendar

<img width="1222" height="601" alt="image" src="https://github.com/user-attachments/assets/78952e17-47e5-43e4-a4eb-40593aaebbc9" />

## Credits
<a href="https://www.flaticon.com/free-icons/woman" title="woman icons">Woman icons created by Magnific - Flaticon</a>
