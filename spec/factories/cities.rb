FactoryBot.define do
  factory :city do
    country
    sequence(:name) { |n| "city#{n}" }
  end
end