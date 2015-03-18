# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

25.times do
  Meetup.find_or_create_by!(name: Faker::Company.catch_phrase,
    description: Faker::Lorem.sentence,
    start_time: Faker::Time.forward(23, :morning),
    end_time: Faker::Time.forward(23, :afternoon),
    location: (Faker::Address.street_address + ", \n" +
      Faker::Address.city + ", " + Faker::Address.state_abbr))
end
