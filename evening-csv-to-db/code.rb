require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "recipe")
    yield(connection)
  ensure
    connection.close
  end
end

ingredients_to_add = ["1 1/2 pounds Brussels sprouts",
                      "3 tablespoons good olive oil",
                      "3/4 teaspoon kosher salt",
                      "1/2 teaspoon freshly ground black pepper"]

ingredients_to_add.each do |ingredient|
  db_connection do |conn|
    conn.exec_params("INSERT INTO ingredients (name) VALUES ($1)", [ingredient])
  end
end

ingredients = db_connection { |conn| conn.exec("SELECT name FROM ingredients") }

list_of_ingredients = []

ingredients.each do |ingredient|
  list_of_ingredients << ingredient["name"]
end

list_of_ingredients.each do |ingredient|
  puts "#{list_of_ingredients.index(ingredient) + 1}: #{ingredient}"
end
