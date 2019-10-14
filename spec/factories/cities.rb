FactoryBot.define do
  factory :city do
    country { create(:country)}
    sequence(:name) { |n| "city#{n}" }
  end
end