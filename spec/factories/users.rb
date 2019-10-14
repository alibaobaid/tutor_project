FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "ali#{n}@jisr.com" }
    password { 'foobar' }
  end
end
