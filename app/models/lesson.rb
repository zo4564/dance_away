class Lesson < ApplicationRecord
  belongs_to :dance_class
  belongs_to :teacher, class_name: "User"

  has_many :bookings, dependent: :destroy

  def booked_places
    bookings.count
  end

  def available_places
    capacity - booked_places
  end

  def booked_by?(user)
    bookings.exists?(student: user)
  end
end