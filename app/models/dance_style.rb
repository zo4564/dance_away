class DanceStyle < ApplicationRecord
  has_many :dance_classes, dependent: :destroy
end
