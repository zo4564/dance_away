class DanceStyle < ApplicationRecord
  has_many :dance_classes, dependent: :destroy

  validates :name, presence: true
  validates :color, presence: true
end
