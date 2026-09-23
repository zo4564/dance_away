class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true, inclusion: { in: %w[student teacher] }

  has_many :teaching_lessons,
           class_name: "Lesson",
           foreign_key: :teacher_id,
           dependent: :nullify

  has_many :bookings,
           foreign_key: :student_id,
           dependent: :destroy

  has_many :booked_lessons,
           through: :bookings,
           source: :lesson

  def teacher?
    role == "teacher"
  end

  def student?
    role == "student"
  end
end