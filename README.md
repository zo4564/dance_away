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


### Admin panel - lessons


### Admin panel - users list


### Lessons list for teachers


### Lessons calendar for teachers


### Teacher applications


### Dance styles



## Credits
<a href="https://www.flaticon.com/free-icons/woman" title="woman icons">Woman icons created by Magnific - Flaticon</a>
