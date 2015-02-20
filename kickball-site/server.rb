require 'pry'
require 'sinatra'
require 'JSON'

def parse_json(file_name)
  file = File.read(file_name)
  roster = JSON.parse(file)
end
get '/' do
  teams = parse_json('roster.json')

  erb :home, locals: { teams: teams }
end

get '/:team_name' do
  teams = parse_json('roster.json')
  team_name = params["team_name"]

  erb :team, locals: { teams: teams, name: team_name }
end

get '/:position' do
  teams = parse_json('roster.json')
  position = params["position"]

  erb :position, locals: { teams: teams, position: position}
end
