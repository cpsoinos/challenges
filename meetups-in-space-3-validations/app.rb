require 'faker'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'
require 'pry'

require_relative 'config/application'

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end

get '/' do
  meetups = Meetup.all
  erb :index, locals: { meetups: meetups }
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/:meetup_id' do |id|
  meetup = Meetup.find_by(id: id)

  erb :meetup, locals: { meetup: meetup }
end

post '/join' do
  user_id = session[:user_id]
  meetup_id = params[:meetup_id]

  if signed_in?
    Member.create(users_id: user_id, meetups_id: meetup_id)
    flash[:notice] = "You've joined the meetup for #{Meetup.find_by(id: meetup_id).name}!"

    redirect "/#{user_id}"
  else
    flash[:notice] = "You must be signed in to do that!"
    redirect "/#{meetup_id}"
  end
end

post '/new_meetup' do
  if signed_in?
    meetup = Meetup.new(params)

    if meetup.save
      flash[:notice] = "You've created a new meetup for #{Meetup.find_by(name: params[:name]).name}"
      redirect "/#{Meetup.find_by(name: params[:name]).id}"
    else
      flash[:notice] = "Something went wrong. Make sure you filled in the correct information."
      redirect '/'
    end
  else
    flash[:notice] = "You must be signed in to do that!"
    redirect '/'
  end
end

get '/auth/github/callback' do
  auth = env['omniauth.auth']

  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/example_protected_page' do
  authenticate!
end
