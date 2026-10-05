class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :name,
            presence: true,
            uniqueness: true

  ROLES = %w[
    student
    teacher
    admin
  ].freeze

  validates :name,
            inclusion: { in: ROLES }
end
