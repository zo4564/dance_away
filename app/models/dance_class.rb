class DanceClass < ApplicationRecord
  belongs_to :dance_style
  has_many :lessons, dependent: :destroy
end
