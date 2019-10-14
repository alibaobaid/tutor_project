FactoryBot.define do
  factory :level do
    sequence(:name) { |n| "level#{n}" }
  end
end
