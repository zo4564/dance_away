class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true, inclusion: { in: %w[student teacher] }

  has_many :teaching_lessons,
           class_name: "Lesson",
           foreign_key: :teacher_id

  has_many :bookings,
           foreign_key: :student_id,
           dependent: :destroy
end