# frozen_string_literal: true
FactoryBot.define do
  factory :booking do
    association :student, factory: :user
    association :lesson
  end
end
