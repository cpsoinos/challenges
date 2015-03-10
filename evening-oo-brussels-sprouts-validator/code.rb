require "pry"

class Ingredient

  def initialize(quantity, unit, name)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def is_valid?
    acceptable = [
        "brussels sprouts",
        "spinach",
        "eggs",
        "milk",
        "tofu",
        "seitan",
        "bell peppers",
        "quinoa",
        "kale",
        "chocolate",
        "beer",
        "wine",
        "whiskey"
        ]

    acceptable.include?(@name.downcase)

  end

  def self.parse(ingredient)
    tokens = ingredient.split(" ")
    quantity = tokens[0].to_f
    unit = tokens[1].to_s
    name = tokens[2].to_s

    Ingredient.new(quantity, unit, name)
  end

  def summary
    "#{@quantity} #{@unit} #{@name}"
  end
end

ingredient = Ingredient.parse("5 tspn(s) milk")
puts ingredient.summary


class Recipe
  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
    @check_recipe = check_recipe
  end

  def list_ingredients
    ingredient_list = ""
    @ingredients.each do |ingredient|
      ingredient_list += "\t- #{ingredient.summary}\n"
    end
    ingredient_list
  end

  def list_instructions
    instruction_list = ""
    @instructions.each_with_index do |instruction, index|
      instruction_list += "\t#{index + 1}. #{instruction}\n"
    end
    instruction_list
  end

  def check_recipe
    @ingredients.each do |ingredient|
      return false if ingredient.is_valid? == false
    end
    return true
  end

  def summary
    <<-SUMMARY
      #{@name}

      Ingredients
      #{list_ingredients}

      Instructions
      #{list_instructions}

      Is this recipe okay? #{check_recipe}
    SUMMARY
  end

end

name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
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

recipe = Recipe.new(name, instructions, ingredients)
puts recipe.summary
