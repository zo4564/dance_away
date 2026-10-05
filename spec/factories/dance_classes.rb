# frozen_string_literal: true

FactoryBot.define do
  factory :dance_class do
    sequence(:name) { |n| "Salsa Beginners #{n}" }
    description { "Beginner dance class" }
    association :dance_style
  end
end
