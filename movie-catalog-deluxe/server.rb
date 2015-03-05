require 'pry'
require 'sinatra'
require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: "movies")
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  redirect "/home"
end

get "/home" do
  erb :home
end


############
## ACTORS ##
############

ACTORS = (db_connection { |conn| conn.exec_params("SELECT name, id FROM actors ORDER BY name ASC") }).to_a

get "/actors" do

  erb :'actors/index', locals: { actors: ACTORS }

end

get "/actors/:id" do |id|

  sql = "SELECT name FROM actors WHERE id = "

  name = (db_connection { |conn| conn.exec_params(sql + id)}).to_a.first["name"]
  id = params[:id]

  sql = <<-eos
  SELECT actors.name, movies.title, cast_members.character
    FROM cast_members
    JOIN movies
    ON cast_members.movie_id = movies.id
    JOIN actors
    ON cast_members.actor_id = actors.id
    WHERE actors.name = '#{name}'
  eos

  actors_id = (db_connection { |conn| conn.exec_params(sql)}).to_a

  erb :'actors/:id', locals: { actors_id: actors_id,
                               name: name }

end


############
## MOVIES ##
############


get "/movies" do

  sql = <<-eos
  SELECT movies.title, movies.year, movies.rating, genres.name AS genre, studios.name AS studio, movies.id
    FROM movies
    LEFT JOIN studios
    ON movies.studio_id = studios.id
    JOIN genres
    ON movies.genre_id = genres.id
    ORDER BY movies.title ASC
  eos

  movies = (db_connection { |conn| conn.exec_params(sql)}).to_a


  erb :'movies/index', locals: { movies: movies }

end

get "/movies/:title" do

  sql = <<-eos
  SELECT genre.name, studio.name, actors.name, cast_members.character, movies.id
    FROM cast_members
    JOIN movies
    JOIN genres
    ON movies.genre_id = genres.id
    JOIN studios
    ON movies.studio_id = studios.id
    ON cast_members.movie_id = movies.id
    JOIN actors
    ON cast_members.actor_id = actors.id
  eos

  movies = (db_connection { |conn| conn.exec_params(sql)}).to_a

  erb :'movies/:id'

end
