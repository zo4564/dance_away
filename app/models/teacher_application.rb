class TeacherApplication < ApplicationRecord
  STATUSES = %w[pending accepted rejected].freeze

  belongs_to :teacher,
             class_name: "User"

  belongs_to :lesson

  validates :status,
            inclusion: { in: STATUSES }

  validates :teacher_id,
            uniqueness: {
              scope: :lesson_id
            }

  validate :teacher_has_teacher_role
  validate :lesson_must_not_have_teacher

  private

  def teacher_has_teacher_role
    return if teacher.blank?

    errors.add(:teacher, "nie ma roli nauczyciela") unless teacher.teacher?
  end

  def lesson_must_not_have_teacher
    return if lesson.blank?

    errors.add(:lesson, "ma już przypisanego nauczyciela") if lesson.teacher.present?
  end
end