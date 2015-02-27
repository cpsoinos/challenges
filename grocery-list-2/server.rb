require 'pry'
require 'sinatra'
require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: "grocery_list")
    yield (connection)
  ensure
    connection.close
  end
end

# Run schema.sql to clear out table in database each time server starts
# ** wouldn't want if server just needed to be restarted, since it would erase
# ** all previously saved data... but do want for this challenge
system "psql grocery_list < schema.sql"

def add_grocery(grocery_item)
  db_connection do |conn|
    conn.exec_params("INSERT INTO groceries VALUES ($1)", [params["grocery_item"]])
  end
end

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  groceries = (db_connection { |conn| conn.exec("SELECT grocery_item FROM groceries") }).to_a
  erb :groceries, locals: { groceries: groceries }
end

post "/groceries" do
  grocery_item = params["grocery_item"]
  add_grocery(grocery_item)
  redirect "/groceries"
end
