FactoryBot.define do
  factory :user, class: User do
    city
    level
    subject
    first_name { Faker::Name.name }
    last_name  { Faker::Name.name }
    sequence(:email) { |n| "ali#{n}@jisr.com" }
    nationality { 'yemen' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
