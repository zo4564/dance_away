FactoryBot.define do
  factory :lesson do
    association :dance_class
    teacher { association :user, :teacher }
    starts_at { Time.zone.parse("2026-09-23 18:00") }
    capacity { 10 }
  end
end