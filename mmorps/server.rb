require "sinatra"
require "pry"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get "/" do
  if session[:visit_count].nil?
    visit_count = 1
  else
    visit_count = session[:visit_count].to_i
  end

  session[:visit_count] = visit_count + 1

  if visit_count == 1
    human_score = 0
    computer_score = 0
    session[:human_score] = 0
    session[:computer_score] = 0
  else
    human_score = session[:human_score]
    computer_score = session[:computer_score]
  end

  erb :rps, locals: { human_score: session[:human_score],
                      computer_score: session[:computer_score] }
end

post "/choose" do
  SHAPES = ["Rock", "Paper", "Scissors"]

  def game
    computer_choice = SHAPES.sample
    human_choice = params["choice"]

    if (human_choice == "Rock" && computer_choice == "Scissors" ) ||
       (human_choice == "Paper" && computer_choice == "Rock") ||
       (human_choice == "Scissors" && computer_choice == "Paper")
      session[:human_score] = (session[:human_score].to_i + 1).to_i
    elsif human_choice != computer_choice
      session[:human_score] = (session[:human_score]).to_i
      session[:computer_score] = (session[:computer_score]).to_i
    else
      session[:computer_score] = (session[:computer_score].to_i + 1).to_i
    end
  end

  # until session[:human_score].to_i >= 2 || session[:computer_score].to_i >= 2
    game
    binding.pry
  # # binding.pry
  #   redirect "/"
  # end

  erb :rps, locals: { rock: params["Rock"],
                      paper: params["Paper"],
                      scissors: params["Scissors"]}
end
