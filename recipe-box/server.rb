require 'pry'
require 'sinatra'
require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: "recipes")
    yield(connection)
  ensure
    connection.close
  end
end

sql = "SELECT name, id, description, instructions FROM recipes ORDER BY name"

RECIPES = (db_connection { |conn| conn.exec_params(sql) }).to_a

get "/" do
  redirect "/recipes"
end

get "/recipes" do

  erb :index, locals: { recipes: RECIPES }
end

get "/recipes/:id" do |id|

  ################################
  # INSTRUCTIONS AND DESCRIPTION #
  ################################

  sql_details = <<-eos
  SELECT name, description, instructions FROM recipes WHERE id = #{params[:id]}
  eos

  recipe_details_arry = (db_connection { |conn| conn.exec_params(sql_details) }).to_a
  recipe_details = recipe_details_arry.first
  instructions = recipe_details["instructions"].split(/\n/)

  def parse_instructions(instructions)
    # remove whitespace
    instructions.each { |instruction| instruction.strip! }
    #delete empty elements
    instructions.delete_if { |instruction| (instruction == "") }
  end

  instructions = parse_instructions(instructions)

  ################################
  ######### INGREDIENTS ##########
  ################################

  # parse_instructions(instructions)

  sql_ingredients = <<-eos
  SELECT ingredients.name
    FROM ingredients
    JOIN recipes ON ingredients.recipe_id = recipes.id
    WHERE recipes.id = #{params[:id]}
  eos

  ingredients = (db_connection { |conn| conn.exec_params(sql_ingredients) }).to_a
  # ingredients = ingredients_arry.first
  #
  # ingredients_list = (db_connection { |conn| conn.exec_params(sql) }).to_a

  erb :recipe_details, locals: { recipe_details: recipe_details,
                                 recipes: RECIPES,
                                 ingredients: ingredients,
                                 instructions: instructions
                               }

end
