require 'pry'
require 'sinatra'
require 'CSV'
require 'uri'
require 'pg'

saved_articles = []

configure do
  enable :sessions
end

def db_connection
  begin
    connection = PG.connect(dbname: "news_aggregator_development")
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  redirect "/articles"
end

get "/articles" do
  articles = (db_connection { |conn| conn.exec("SELECT title,url,description FROM articles") }).to_a

  erb :index, locals: { articles: articles }
end

get "/articles/new" do
  erb :form
end

post "/articles/form" do
  session[:error_blank] = false
  session[:error_field] = nil
  session[:error_url] = false
  session[:error_description] = false
  session[:error_duplicate_url] = false

  erb :form, locals: { title: params["title"],
                       url: params["url"],
                       description: params["description"] }

  existing_urls = (db_connection { |conn| conn.exec("SELECT url FROM articles")}).to_a

  existing_urls.each do |url|
    if url =~ [params[:url]]
      session[:error_duplicate_url] = true
      redirect "articles/error"
    end
  end

  if params.has_value?("")
    session[:error_blank] = true
    session[:error_field] = params.key("")
    redirect "articles/error"
  elsif params[:url] !~ /\A#{URI::regexp}\z/
    session[:error_url] = true
    redirect "articles/error"
  elsif params[:description].length <= 20
    session[:error_description] = true
    redirect "articles/error"
  end

  db_connection do |conn|
    conn.exec_params("INSERT INTO articles VALUES ($1, $2, $3)", [params["title"], params["url"], params["description"]])
  end

  redirect "/articles"
end

get "/articles/error" do
  erb :error, locals: { title: params["title"],
                       url: params["url"],
                       description: params["description"] }
end
