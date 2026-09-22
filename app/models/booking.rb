class Booking < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :lesson

  validates :lesson_id, uniqueness: { scope: :student_id }
end