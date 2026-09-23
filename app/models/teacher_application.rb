class TeacherApplication < ApplicationRecord
  STATUSES = %w[pending accepted rejected].freeze

  belongs_to :teacher, class_name: "User"
  belongs_to :lesson

  validates :status, inclusion: { in: STATUSES }

  validates :teacher_id,
            uniqueness: {
              scope: :lesson_id
            }

  validate :teacher_has_teacher_role

  private

  def teacher_has_teacher_role
    return if teacher.blank?

    errors.add(:teacher, "nie ma roli nauczyciela") unless teacher.teacher?
  end
end