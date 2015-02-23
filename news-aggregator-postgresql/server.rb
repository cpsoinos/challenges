require 'pry'
require 'sinatra'
require 'CSV'
require 'uri'

saved_articles = []

configure do
  enable :sessions
end

get "/articles" do
  CSV.foreach('database.csv', headers:true, header_converters: :symbol) do |row|
     saved_articles << row.to_hash
     saved_articles = saved_articles.uniq
   end
  erb :index, locals: { saved_articles: saved_articles }
end

get "/articles/new" do
  erb :form
end

post "/articles/form" do
  article_to_add = []
  session[:error_blank] = false
  session[:error_field] = nil
  session[:error_url] = false
  session[:error_description] = false
  session[:error_duplicate_url] = false

  erb :form, locals: { title: params["title"],
                       url: params["url"],
                       description: params["description"] }

  CSV.open("database.csv", "r") do |row|
    if row =~ [params[:url]]
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

  params.each do |_header, input|
    article_to_add << input
  end
  CSV.open("database.csv", "a") do |csv|
    csv << article_to_add
  end

  redirect "/articles"
end

get "/articles/error" do
  erb :error, locals: { title: params["title"],
                       url: params["url"],
                       description: params["description"] }
end
