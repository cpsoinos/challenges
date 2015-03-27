require 'factory-girl'

FactoryGirl.define do
    factory :restaurant do
      sequence(:name) { |n| "Restaurant#{n}" }
      address "Valid"
      city "Valid"
      state "Valid"
      zip_code "Valid"
      description "Valid"
      category
    end

    factory :cateory do
      sequence(:name) { |n| "Category#{n}" }
    end

    factory :review do
      body "Valid"
      rating "Valid"
      restaurant
    end
end
