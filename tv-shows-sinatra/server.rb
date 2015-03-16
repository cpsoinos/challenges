require "sinatra"
require "sinatra/activerecord"
require "pry"

set :views, File.join(File.dirname(__FILE__), "app/views")
require_relative "app/models/television_show"

get "/" do
  redirect "/television_shows"
end

get "/television_shows" do
  shows = TelevisionShow.all
  erb :index, locals: { shows: shows }
end

get "/television_shows/new" do
  show = TelevisionShow.new
  erb :new, locals: { show: show }
end

get "/television_shows/:id" do
  show = TelevisionShow.find(params[:id])
  error = "Error! Information missing."

  erb :show, locals: { show: show, error: error }
end

post "/television_shows" do
  error = nil
  show = TelevisionShow.new(params[:television_show])
  if params[:television_show][:title] == "" || params[:television_show][:network] == "" || params[:television_show][:starting_year] == ""
    error = "Error: Please provide title, network, and starting year."
  elsif params[:television_show][:starting_year].to_i < 1900
    error = "Error: Show must have started and ended after 1900."
  elsif params[:television_show][:synopsis].length > 5000
    error = "Error: Synopsis cannot be more than 5000 characters."
  else
    if show.save
      redirect "/television_shows"
    end
  end
  erb :new, locals: { show: show, error: error }
end
