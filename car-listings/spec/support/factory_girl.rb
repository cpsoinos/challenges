require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :manufacturer do
    sequence(:name) { |n| "#{Faker::Company.name} #{n}" }
    country Faker::Address.country
  end

end
