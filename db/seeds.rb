# db/seeds.rb
Booking.delete_all
TeacherApplication.delete_all
Lesson.delete_all
DanceClass.delete_all
DanceStyle.delete_all
UserRole.delete_all
User.delete_all
Role.delete_all

puts "Creating roles..."

student_role = Role.create!(name: "student")
teacher_role = Role.create!(name: "teacher")
admin_role   = Role.create!(name: "admin")

puts "Creating users..."

admin = User.create!(
  email: "admin@example.com",
  password: "123123",
  password_confirmation: "123123",
  first_name: "Anna",
  last_name: "Admin"
)
admin.roles << admin_role

teachers = [
  User.create!(
    email: "sofia@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Sofia",
    last_name: "Kowalska"
  ),
  User.create!(
    email: "mateusz@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Mateusz",
    last_name: "Nowak"
  ),
  User.create!(
    email: "julia@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Julia",
    last_name: "Wójcik"
  ),
  User.create!(
    email: "kamil@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Kamil",
    last_name: "Lewandowski"
  ),
  User.create!(
    email: "olivia@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Olivia",
    last_name: "Zielińska"
  )
]

teachers.each do |teacher|
  teacher.roles << teacher_role
end

# Jeden użytkownik może mieć więcej niż jedną rolę.
# Dzięki temu możemy np. mieć admina, który jest jednocześnie nauczycielem.
admin.roles << teacher_role

students = [
  User.create!(
    email: "michal@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Michał",
    last_name: "Kaczmarek"
  ),
  User.create!(
    email: "zuzanna@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Zuzanna",
    last_name: "Mazur"
  ),
  User.create!(
    email: "aleksandra@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Aleksandra",
    last_name: "Król"
  ),
  User.create!(
    email: "jakub@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Jakub",
    last_name: "Dąbrowski"
  ),
  User.create!(
    email: "natalia@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Natalia",
    last_name: "Piotrowska"
  ),
  User.create!(
    email: "karolina@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Karolina",
    last_name: "Grabowska"
  ),
  User.create!(
    email: "tomasz@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Tomasz",
    last_name: "Pawlak"
  ),
  User.create!(
    email: "weronika@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Weronika",
    last_name: "Michalska"
  ),
  User.create!(
    email: "piotr@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Piotr",
    last_name: "Sikora"
  ),
  User.create!(
    email: "amelia@example.com",
    password: "123123",
    password_confirmation: "123123",
    first_name: "Amelia",
    last_name: "Lis"
  )
]

students.each do |student|
  student.roles << student_role
end

puts "Creating dance styles..."

salsa = DanceStyle.create!(
  name: "Salsa",
  color: "#E63946"
)

bachata = DanceStyle.create!(
  name: "Bachata",
  color: "#F4A261"
)

dancehall = DanceStyle.create!(
  name: "Dancehall",
  color: "#2A9D8F"
)

hip_hop = DanceStyle.create!(
  name: "Hip Hop",
  color: "#264653"
)

jazz = DanceStyle.create!(
  name: "Jazz",
  color: "#6A4C93"
)

commercial = DanceStyle.create!(
  name: "Commercial",
  color: "#FF6B6B"
)

kpop = DanceStyle.create!(
  name: "K-pop",
  color: "#C77DFF"
)

puts "Creating dance classes..."

salsa_beginner = DanceClass.create!(
  name: "Salsa Beginners",
  description: "Podstawy salsy dla osób zaczynających swoją przygodę z tańcem.",
  dance_style: salsa
)

salsa_intermediate = DanceClass.create!(
  name: "Salsa Intermediate",
  description: "Salsa na poziomie średniozaawansowanym.",
  dance_style: salsa
)

bachata_beginner = DanceClass.create!(
  name: "Bachata Beginners",
  description: "Podstawowe kroki, prowadzenie i styling bachaty.",
  dance_style: bachata
)

bachata_sensual = DanceClass.create!(
  name: "Bachata Sensual",
  description: "Bachata sensual, izolacje, body movement i musicality.",
  dance_style: bachata
)

dancehall_beginner = DanceClass.create!(
  name: "Dancehall Beginners",
  description: "Podstawy dancehallu, groove i fundamenty jamajskiego stylu.",
  dance_style: dancehall
)

dancehall_open = DanceClass.create!(
  name: "Dancehall Open Level",
  description: "Energetyczne choreografie dancehall dla różnych poziomów.",
  dance_style: dancehall
)

hip_hop_beginner = DanceClass.create!(
  name: "Hip Hop Beginners",
  description: "Podstawy hip hopu, groove, bounce i podstawowe kroki.",
  dance_style: hip_hop
)

hip_hop_choreo = DanceClass.create!(
  name: "Hip Hop Choreography",
  description: "Choreografie hip hopowe z naciskiem na musicality i performance.",
  dance_style: hip_hop
)

jazz_beginner = DanceClass.create!(
  name: "Jazz Beginners",
  description: "Podstawy jazzu, technika, izolacje i choreografie.",
  dance_style: jazz
)

commercial_open = DanceClass.create!(
  name: "Commercial Open",
  description: "Dynamiczne choreografie inspirowane teledyskami i sceną.",
  dance_style: commercial
)

kpop_choreo = DanceClass.create!(
  name: "K-pop Choreography",
  description: "Choreografie inspirowane najpopularniejszymi zespołami K-pop.",
  dance_style: kpop
)

kpop_beginner = DanceClass.create!(
  name: "K-pop Beginners",
  description: "Podstawy choreografii K-pop dla początkujących.",
  dance_style: kpop
)

puts "Creating lessons..."

now = Time.current

lessons = []

# Salsa

lessons << Lesson.create!(
  dance_class: salsa_beginner,
  teacher: teachers[0],
  starts_at: now.change(hour: 17, min: 0) + 1.day,
  capacity: 15
)

lessons << Lesson.create!(
  dance_class: salsa_beginner,
  teacher: teachers[0],
  starts_at: now.change(hour: 17, min: 0) + 8.days,
  capacity: 15
)

lessons << Lesson.create!(
  dance_class: salsa_intermediate,
  teacher: teachers[1],
  starts_at: now.change(hour: 19, min: 0) + 2.days,
  capacity: 12
)

lessons << Lesson.create!(
  dance_class: salsa_intermediate,
  teacher: teachers[1],
  starts_at: now.change(hour: 19, min: 0) + 9.days,
  capacity: 12
)

# Bachata

lessons << Lesson.create!(
  dance_class: bachata_beginner,
  teacher: teachers[0],
  starts_at: now.change(hour: 18, min: 0) + 2.days,
  capacity: 16
)

lessons << Lesson.create!(
  dance_class: bachata_beginner,
  teacher: teachers[0],
  starts_at: now.change(hour: 18, min: 0) + 9.days,
  capacity: 16
)

lessons << Lesson.create!(
  dance_class: bachata_sensual,
  teacher: teachers[2],
  starts_at: now.change(hour: 20, min: 0) + 3.days,
  capacity: 14
)

lessons << Lesson.create!(
  dance_class: bachata_sensual,
  teacher: teachers[2],
  starts_at: now.change(hour: 20, min: 0) + 10.days,
  capacity: 14
)

# Dancehall

lessons << Lesson.create!(
  dance_class: dancehall_beginner,
  teacher: teachers[3],
  starts_at: now.change(hour: 17, min: 30) + 3.days,
  capacity: 18
)

lessons << Lesson.create!(
  dance_class: dancehall_open,
  teacher: teachers[3],
  starts_at: now.change(hour: 19, min: 30) + 4.days,
  capacity: 18
)

lessons << Lesson.create!(
  dance_class: dancehall_open,
  teacher: nil,
  starts_at: now.change(hour: 19, min: 30) + 11.days,
  capacity: 18
)

# Hip Hop

lessons << Lesson.create!(
  dance_class: hip_hop_beginner,
  teacher: teachers[1],
  starts_at: now.change(hour: 17, min: 0) + 4.days,
  capacity: 20
)

lessons << Lesson.create!(
  dance_class: hip_hop_choreo,
  teacher: teachers[3],
  starts_at: now.change(hour: 20, min: 0) + 5.days,
  capacity: 18
)

lessons << Lesson.create!(
  dance_class: hip_hop_choreo,
  teacher: nil,
  starts_at: now.change(hour: 20, min: 0) + 12.days,
  capacity: 18
)

# Jazz

lessons << Lesson.create!(
  dance_class: jazz_beginner,
  teacher: teachers[2],
  starts_at: now.change(hour: 18, min: 0) + 5.days,
  capacity: 15
)

lessons << Lesson.create!(
  dance_class: jazz_beginner,
  teacher: teachers[2],
  starts_at: now.change(hour: 18, min: 0) + 12.days,
  capacity: 15
)

# Commercial

lessons << Lesson.create!(
  dance_class: commercial_open,
  teacher: teachers[4],
  starts_at: now.change(hour: 19, min: 0) + 6.days,
  capacity: 20
)

lessons << Lesson.create!(
  dance_class: commercial_open,
  teacher: teachers[4],
  starts_at: now.change(hour: 19, min: 0) + 13.days,
  capacity: 20
)

# K-pop

lessons << Lesson.create!(
  dance_class: kpop_beginner,
  teacher: teachers[4],
  starts_at: now.change(hour: 17, min: 0) + 6.days,
  capacity: 20
)

lessons << Lesson.create!(
  dance_class: kpop_choreo,
  teacher: teachers[4],
  starts_at: now.change(hour: 19, min: 0) + 7.days,
  capacity: 20
)

lessons << Lesson.create!(
  dance_class: kpop_choreo,
  teacher: nil,
  starts_at: now.change(hour: 19, min: 0) + 14.days,
  capacity: 20
)

puts "Creating teacher applications..."

# Zgłoszenia nauczycieli do lekcji.
# Część z nich jest pending, część rejected, a część accepted.

TeacherApplication.create!(
  teacher: teachers[1],
  lesson: lessons[0],
  status: "pending"
)

TeacherApplication.create!(
  teacher: teachers[2],
  lesson: lessons[0],
  status: "rejected"
)

TeacherApplication.create!(
  teacher: teachers[0],
  lesson: lessons[2],
  status: "accepted"
)

TeacherApplication.create!(
  teacher: teachers[2],
  lesson: lessons[8],
  status: "pending"
)

TeacherApplication.create!(
  teacher: teachers[3],
  lesson: lessons[10],
  status: "pending"
)

TeacherApplication.create!(
  teacher: teachers[4],
  lesson: lessons[13],
  status: "pending"
)

TeacherApplication.create!(
  teacher: teachers[1],
  lesson: lessons[13],
  status: "rejected"
)

TeacherApplication.create!(
  teacher: teachers[0],
  lesson: lessons[20],
  status: "pending"
)

TeacherApplication.create!(
  teacher: teachers[2],
  lesson: lessons[20],
  status: "pending"
)

puts "Creating bookings..."

def book(student, lesson)
  booking = Booking.create(
    student: student,
    lesson: lesson
  )
end

# Salsa Beginners
book(students[0], lessons[0])
book(students[1], lessons[0])
book(students[2], lessons[0])
book(students[3], lessons[0])

book(students[0], lessons[1])
book(students[4], lessons[1])
book(students[5], lessons[1])

# Salsa Intermediate
book(students[2], lessons[2])
book(students[3], lessons[2])
book(students[6], lessons[2])

book(students[7], lessons[3])
book(students[8], lessons[3])

# Bachata Beginners
book(students[1], lessons[4])
book(students[5], lessons[4])
book(students[9], lessons[4])

book(students[0], lessons[5])
book(students[4], lessons[5])
book(students[7], lessons[5])

# Bachata Sensual
book(students[3], lessons[6])
book(students[5], lessons[6])
book(students[6], lessons[6])
book(students[8], lessons[6])

book(students[1], lessons[7])
book(students[2], lessons[7])

# Dancehall
book(students[4], lessons[8])
book(students[6], lessons[8])
book(students[9], lessons[8])

book(students[0], lessons[9])
book(students[3], lessons[9])
book(students[5], lessons[9])
book(students[8], lessons[9])

# Lekcja bez nauczyciela
book(students[2], lessons[10])
book(students[7], lessons[10])

# Hip Hop
book(students[0], lessons[11])
book(students[1], lessons[11])
book(students[6], lessons[11])

book(students[3], lessons[12])
book(students[4], lessons[12])
book(students[8], lessons[12])
book(students[9], lessons[12])

# Lekcja bez nauczyciela
book(students[2], lessons[13])
book(students[5], lessons[13])

# Jazz
book(students[1], lessons[14])
book(students[4], lessons[14])
book(students[7], lessons[14])

book(students[0], lessons[15])
book(students[6], lessons[15])

# Commercial
book(students[2], lessons[16])
book(students[3], lessons[16])
book(students[5], lessons[16])
book(students[9], lessons[16])

book(students[1], lessons[17])
book(students[4], lessons[17])
book(students[8], lessons[17])

# K-pop
book(students[0], lessons[18])
book(students[2], lessons[18])
book(students[5], lessons[18])
book(students[7], lessons[18])
book(students[9], lessons[18])

book(students[1], lessons[19])
book(students[3], lessons[19])
book(students[4], lessons[19])
book(students[6], lessons[19])

# Lekcja K-pop bez nauczyciela
book(students[2], lessons[20])
book(students[7], lessons[20])

puts
puts "Seed completed!"
puts
puts "Admin:"
puts "  admin@example.com / 123123"
puts
puts "Teachers:"
teachers.each do |teacher|
  puts "  #{teacher.email} / 123123"
end
puts
puts "Students:"
students.each do |student|
  puts "  #{student.email} / 123123"
end
