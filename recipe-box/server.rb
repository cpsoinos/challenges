require 'pry'
require 'sinatra'
require 'pg'

####################
## HELPER METHODS ##
####################

def db_connection
  begin
    connection = PG.connect(dbname: "recipes")
    yield(connection)
  ensure
    connection.close
  end
end

def get_recipes
  sql = "SELECT name, id, description, instructions FROM recipes ORDER BY name"
  recipes = (db_connection { |conn| conn.exec_params(sql) }).to_a
  recipes
end

SQL_RECIPE_INFO = "SELECT * FROM recipes WHERE id = $1"

def get_recipe_details(id)
  recipe_details = (db_connection { |conn| conn.exec_params(SQL_RECIPE_INFO, [id]) }).to_a[0]
  recipe_details
end

def get_instructions(id)
  instructions = (db_connection { |conn| conn.exec_params(SQL_RECIPE_INFO, [id]) }).to_a[0]
  instructions = instructions["instructions"].split(/\n/)
  instructions.each { |instruction| instruction.strip! }
  instructions.delete_if { |instruction| (instruction == "") }
  instructions
end

def get_ingredients(id)
  sql = "SELECT * FROM ingredients WHERE recipe_id = $1"
  ingredients = (db_connection { |conn| conn.exec_params(sql, [id]) }).to_a
  ingredients
end

############
## ROUTES ##
############

get "/" do
  redirect "/recipes"
end

get "/recipes" do
  @recipes = get_recipes

  erb :index
end

get "/recipes/:id" do |id|
  @recipe_details = get_recipe_details(id)
  @ingredients = get_ingredients(id)
  @instructions = get_instructions(id)

  erb :recipe_details
end
