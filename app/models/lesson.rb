class Lesson < ApplicationRecord
  DURATION = 2.hours

  belongs_to :dance_class
  belongs_to :teacher,
             class_name: "User",
             optional: true

  has_many :bookings,
           dependent: :destroy

  has_many :teacher_applications,
           dependent: :destroy

  validates :starts_at, presence: true
  validates :capacity,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0
            }

  def ends_at
    starts_at + DURATION
  end

  def booked_places
    bookings.count
  end

  def available_places
    capacity - booked_places
  end

  def booked_by?(user)
    bookings.exists?(student: user)
  end

  def teacher_applied?(user)
    teacher_applications.exists?(teacher: user)
  end
end
