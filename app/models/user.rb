class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles,
           dependent: :destroy

  has_many :roles,
           through: :user_roles

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

  validates :first_name, presence: true
  validates :last_name, presence: true

  def student?
    has_role?("student")
  end

  def teacher?
    has_role?("teacher")
  end

  def admin?
    has_role?("admin")
  end

  def has_role?(role_name)
    roles.exists?(name: role_name)
  end
end