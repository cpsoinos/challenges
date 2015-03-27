# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  [
    'Thai',
    'French',
    'Chinese',
    'Italian',
    'Tex-Mex'
  ].each do |category_name|
    Category.find_or_create_by!(name: category_name)
  end

  10.times do
    FactoryGirl.create(:restaurant)
  end

  50.times do
    FactoryGirl.create(:review)
  end
end
