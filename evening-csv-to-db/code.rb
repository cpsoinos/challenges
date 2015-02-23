require 'pg'
require 'pry'
require 'csv'

def db_connection
  begin
    connection = PG.connect(dbname: "recipe")
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach("ingredients.csv") do |row|
    binding.pry
    db_connection do |conn|
      conn.exec_params("INSERT INTO ingredients (name) VALUES ($1)", [row[1]])
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
