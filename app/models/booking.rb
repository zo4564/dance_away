class Booking < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :lesson

  validates :lesson_id, uniqueness: { scope: :student_id }
  validate :student_has_no_time_conflict

  private

  def student_has_no_time_conflict
    return if student.blank? || lesson.blank? || lesson.starts_at.blank?

    conflict_exists = student.bookings
                             .joins(:lesson)
                             .where.not(id: id)
                             .where(
                               "lessons.starts_at < ? AND lessons.starts_at > ?",
                               lesson.ends_at,
                               lesson.starts_at - Lesson::DURATION
                             )
                             .exists?

    errors.add(:base, :booking_conflict) if conflict_exists
  end
end