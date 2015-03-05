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

get "/actors" do
  actors = (db_connection { |conn| conn.exec_params("SELECT name FROM actors ORDER BY name ASC") }).to_a
  # binding.pry

  erb :actors, locals: { actors: actors }

end

get "/movies" do
  movies = (db_connection { |conn| conn.exec_params("SELECT movies.title, movies.year, movies.rating, genres.name, studios.name
                                                      FROM movies
                                                      LEFT JOIN studios
                                                      ON movies.studio_id = studios.id
                                                      JOIN genres
                                                      ON movies.genre_id = genres.id
                                                      ORDER BY movies.title ASC")}).to_a
  erb :movies, locals: { movies: movies }




#
# SELECT movies.title, cast_members.name
#                       FROM cast_members
#                       JOIN movies
#                       ON cast_members.movie_id = movies.id
#                       JOIN actors
#                       ON cast_members.actor_id = actors.id
