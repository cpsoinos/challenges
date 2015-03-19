class Ingredient

  def initialize(name, id)
    @name = name
    @id   = id
  end

  attr_accessor :name, :id

  def self.db_connection
    begin
      connection = PG.connect(dbname: "recipes")
      yield(connection)
    ensure
      connection.close
    end
  end

  def self.all
    @ingredients = []
    sql = "SELECT name, recipe_id FROM ingredients"
    @ingredient_list = (db_connection { |conn| conn.exec_params(sql) }).to_a
    @ingredient_list.each do |ingredient|
      @ingredients << Ingredient.new(ingredient["name"], ingredient["recipe_id"])
    end
    @ingredients
  end

  def self.find(argument)
    @found_ingredients = []
    @ingredients.each do |ingredient|
      if ingredient.id == argument
        @found_ingredients << ingredient
      end
    end
    @found_ingredients
  end

end
