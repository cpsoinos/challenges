class Recipe

  def initialize(id, name, instructions, description)
    @id           = id
    @name         = name
    @instructions = instructions
    @description  = description
  end

  attr_accessor :id, :name, :instructions, :description

  def self.db_connection
    begin
      connection = PG.connect(dbname: "recipes")
      yield(connection)
    ensure
      connection.close
    end
  end

  def self.all
    @recipes = []
    sql = <<-eos
      SELECT recipes.id AS recipe_id, recipes.name AS recipe_name,
        recipes.instructions AS recipe_instructions,
        recipes.description AS recipe_description,
        ingredients.name AS ingredient_name,
        ingredients.recipe_id AS ingredients_recipe_id
      FROM recipes
      JOIN ingredients ON ingredients.recipe_id = recipes.id
    eos
    @collected_recipes = (db_connection { |conn| conn.exec_params(sql) }).to_a
    @collected_recipes.each do |recipe|
      recipe = Recipe.new(recipe["recipe_id"], recipe["recipe_name"], recipe["recipe_instructions"], recipe["recipe_description"])
      @recipes << recipe
    end
    @recipes
  end

  def self.find(argument)
    @recipes.each do |recipe|
      if recipe.id == argument
        return recipe
      end
    end
    Recipe.new(argument, "Error", "This recipe doesn't have any instructions.", "This recipe doesn't have a description.")
  end

  def ingredients
    Ingredient.all
    id = self.id
    @ingredients = Ingredient.find(id)
    @ingredients
  end

end
