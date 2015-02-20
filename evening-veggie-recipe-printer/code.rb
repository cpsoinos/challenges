recipe = {
  name: "Roasted Brussel Sprouts",
  ingredients: [
    "1 1/2 pounds Brussels sprouts",
    "3 tablespoons good olive oil",
    "3/4 teaspoon kosher salt",
    "1/2 teaspoon freshly ground black pepper"
    ],
  directions: [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]
  }

# 1. First produce the formatted output with plain Ruby.

puts "#=================================#"
puts "# Recipe: #{recipe[:name]} #"
puts "#=================================#"
puts
puts recipe.keys[1].capitalize
puts "-----------"
puts
recipe[:ingredients].each do |ingredient|
  puts ingredient
end
puts
puts recipe.keys[2].capitalize
puts "-----------"
puts
step_number = 1
recipe[:directions].each do |direction|
  puts "#{step_number}. #{direction}"
  puts
  step_number += 1
end
