# frozen_string_literal: true

PASSWORD = "111111"

puts "Cleaning development data..."

Booking.delete_all
Lesson.delete_all
DanceClass.delete_all
DanceStyle.delete_all
User.delete_all

puts "Creating users..."

teachers = [
  {
    email: "anna@example.com",
    first_name: "Anna",
    last_name: "Nowak"
  },
  {
    email: "piotr@example.com",
    first_name: "Piotr",
    last_name: "Kowalski"
  },
  {
    email: "marta@example.com",
    first_name: "Marta",
    last_name: "Wiśniewska"
  }
].map do |attributes|
  User.create!(
    **attributes,
    password: PASSWORD,
    role: "teacher"
  )
end

students = [
  {
    email: "jan@example.com",
    first_name: "Jan",
    last_name: "Kowalski"
  },
  {
    email: "kasia@example.com",
    first_name: "Katarzyna",
    last_name: "Nowak"
  },
  {
    email: "tomek@example.com",
    first_name: "Tomasz",
    last_name: "Wójcik"
  },
  {
    email: "ania@example.com",
    first_name: "Anna",
    last_name: "Lewandowska"
  },
  {
    email: "michal@example.com",
    first_name: "Michał",
    last_name: "Kamiński"
  },
  {
    email: "ola@example.com",
    first_name: "Aleksandra",
    last_name: "Zielińska"
  }
].map do |attributes|
  User.create!(
    **attributes,
    password: PASSWORD,
    role: "student"
  )
end

puts "Creating dance styles..."

styles = {
  salsa: DanceStyle.create!(
    name: "Salsa",
    color: "#E76F51"
  ),

  bachata: DanceStyle.create!(
    name: "Bachata",
    color: "#2A9D8F"
  ),

  kizomba: DanceStyle.create!(
    name: "Kizomba",
    color: "#457B9D"
  ),

  hip_hop: DanceStyle.create!(
    name: "Hip Hop",
    color: "#9B5DE5"
  ),

  contemporary: DanceStyle.create!(
    name: "Contemporary",
    color: "#F4A261"
  ),

  jazz: DanceStyle.create!(
    name: "Jazz",
    color: "#E9C46A"
  )
}

puts "Creating dance classes..."

classes = {
  salsa_beginner: DanceClass.create!(
    name: "Salsa Beginners",
    description: "Podstawy salsy dla osób rozpoczynających naukę.",
    dance_style: styles[:salsa]
  ),

  salsa_intermediate: DanceClass.create!(
    name: "Salsa Intermediate",
    description: "Salsa dla osób znających podstawowe kroki i figury.",
    dance_style: styles[:salsa]
  ),

  bachata_beginner: DanceClass.create!(
    name: "Bachata Beginners",
    description: "Pierwsze kroki bachaty i podstawowe figury.",
    dance_style: styles[:bachata]
  ),

  bachata_intermediate: DanceClass.create!(
    name: "Bachata Intermediate",
    description: "Rozwijanie techniki i bardziej zaawansowanych figur bachaty.",
    dance_style: styles[:bachata]
  ),

  kizomba_beginner: DanceClass.create!(
    name: "Kizomba Beginners",
    description: "Wprowadzenie do podstaw kizomby.",
    dance_style: styles[:kizomba]
  ),

  hip_hop_beginner: DanceClass.create!(
    name: "Hip Hop Beginners",
    description: "Podstawy hip hopu i pracy z rytmem.",
    dance_style: styles[:hip_hop]
  ),

  contemporary: DanceClass.create!(
    name: "Contemporary",
    description: "Technika contemporary, ruch i interpretacja muzyki.",
    dance_style: styles[:contemporary]
  ),

  jazz_beginner: DanceClass.create!(
    name: "Jazz Beginners",
    description: "Podstawy techniki jazzowej.",
    dance_style: styles[:jazz]
  )
}

puts "Creating lessons..."

def create_lesson(dance_class:, teacher:, starts_at:, capacity: 10)
  Lesson.create!(
    dance_class: dance_class,
    teacher: teacher,
    starts_at: starts_at,
    capacity: capacity
  )
end

lessons = []

lessons << create_lesson(
  dance_class: classes[:salsa_beginner],
  teacher: teachers[0],
  starts_at: Time.zone.parse("2026-09-24 18:00"),
  capacity: 10
)

lessons << create_lesson(
  dance_class: classes[:salsa_intermediate],
  teacher: teachers[1],
  starts_at: Time.zone.parse("2026-09-24 20:00"),
  capacity: 12
)

lessons << create_lesson(
  dance_class: classes[:bachata_beginner],
  teacher: teachers[2],
  starts_at: Time.zone.parse("2026-09-25 18:00"),
  capacity: 10
)

lessons << create_lesson(
  dance_class: classes[:bachata_intermediate],
  teacher: teachers[0],
  starts_at: Time.zone.parse("2026-09-25 20:00"),
  capacity: 8
)

lessons << create_lesson(
  dance_class: classes[:kizomba_beginner],
  teacher: teachers[1],
  starts_at: Time.zone.parse("2026-09-26 16:00"),
  capacity: 10
)

lessons << create_lesson(
  dance_class: classes[:hip_hop_beginner],
  teacher: teachers[2],
  starts_at: Time.zone.parse("2026-09-26 18:00"),
  capacity: 15
)

lessons << create_lesson(
  dance_class: classes[:contemporary],
  teacher: teachers[0],
  starts_at: Time.zone.parse("2026-09-27 16:00"),
  capacity: 12
)

lessons << create_lesson(
  dance_class: classes[:jazz_beginner],
  teacher: teachers[1],
  starts_at: Time.zone.parse("2026-09-27 18:00"),
  capacity: 10
)

lessons << create_lesson(
  dance_class: classes[:salsa_beginner],
  teacher: teachers[2],
  starts_at: Time.zone.parse("2026-09-28 18:00"),
  capacity: 5
)

lessons << create_lesson(
  dance_class: classes[:bachata_beginner],
  teacher: teachers[0],
  starts_at: Time.zone.parse("2026-09-28 20:00"),
  capacity: 6
)

puts "Creating bookings..."

# Jan attends two different lessons.
Booking.create!(
  student: students[0],
  lesson: lessons[0]
)

Booking.create!(
  student: students[0],
  lesson: lessons[2]
)

# Kasia attends Salsa and Bachata.
Booking.create!(
  student: students[1],
  lesson: lessons[0]
)

Booking.create!(
  student: students[1],
  lesson: lessons[3]
)

# Tomek attends Hip Hop and Contemporary.
Booking.create!(
  student: students[2],
  lesson: lessons[5]
)

Booking.create!(
  student: students[2],
  lesson: lessons[6]
)

# Ania attends several classes.
Booking.create!(
  student: students[3],
  lesson: lessons[1]
)

Booking.create!(
  student: students[3],
  lesson: lessons[4]
)

Booking.create!(
  student: students[3],
  lesson: lessons[7]
)

# Michał attends the small-capacity Salsa class.
Booking.create!(
  student: students[4],
  lesson: lessons[8]
)

# Ola attends Bachata.
Booking.create!(
  student: students[5],
  lesson: lessons[9]
)

puts
puts "Seed completed."
puts
puts "Teachers:"
teachers.each do |teacher|
  puts "  #{teacher.email} / #{PASSWORD}"
end

puts
puts "Students:"
students.each do |student|
  puts "  #{student.email} / #{PASSWORD}"
end

puts
puts "Created:"
puts "  Users:         #{User.count}"
puts "  Dance styles:  #{DanceStyle.count}"
puts "  Dance classes: #{DanceClass.count}"
puts "  Lessons:       #{Lesson.count}"
puts "  Bookings:      #{Booking.count}"