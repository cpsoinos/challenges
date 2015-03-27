FactoryGirl.define do
    factory :restaurant do
      sequence(:name) { |n| "Restaurant#{n}" }
      address Faker::Address.street_address
      city Faker::Address.city
      state Faker::Address.state
      zip_code Faker::Address.zip_code
      description Faker::Lorem.sentence
    end

    # factory :category do
    #   name { ['Thai', 'French', 'Chinese', 'Italian', 'Tex-Mex'].sample }
    #   # sequence(:name) { |n| "Category#{n}" }
    # end

    factory :review do
      body Faker::Lorem.paragraph
      rating { rand(1..5) }
      restaurant
    end
end
