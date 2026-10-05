FactoryBot.define do
  factory :dance_style do
    sequence(:name) { |n| "Salsa #{n}" }
    color { "#E76F51" }
  end
end
