# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    first_name { "Jan" }
    last_name { "Kowalski" }

    trait :student do
      after(:create) do |user|
        user.roles << Role.find_or_create_by!(name: "student")
      end
    end

    trait :teacher do
      after(:create) do |user|
        user.roles << Role.find_or_create_by!(name: "teacher")
      end
    end

    trait :admin do
      after(:create) do |user|
        user.roles << Role.find_or_create_by!(name: "admin")
      end
    end
  end
end
