require "sinatra"
require "pry"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get "/" do
  if session[:visit_count].nil?
    visit_count = 1
    session[:human_score] = nil
    session[:computer_score] = nil
    session[:result_message] = nil
    session[:game_result] = nil
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

  if visit_count > 1
    session[:result_message] = "You chose #{session[:human_choice]}. Computer chose #{session[:computer_choice]}. #{session[:result]}."
  else
    session[:result_message] = ""
  end

  erb :rps, locals: { human_score: session[:human_score],
                      computer_score: session[:computer_score],
                      human_choice: session[:human_choice],
                      computer_choice: session[:computer_choice],
                      visit_count: session[:visit_count],
                      result: session[:result],
                      result_message: session[:result_message]}

end

SHAPES = ["Rock", "Paper", "Scissors"]

post "/choose" do
  def game
    computer_choice = SHAPES.sample
    session[:computer_choice] = computer_choice
    human_choice = params["choice"]
    session[:human_choice] = human_choice

    if (human_choice == "Rock" && computer_choice == "Scissors" ) ||
       (human_choice == "Paper" && computer_choice == "Rock") ||
       (human_choice == "Scissors" && computer_choice == "Paper")
      session[:result] = "You score"
      session[:human_score] = (session[:human_score].to_i + 1).to_i
      if session[:human_score] == 2
        session[:game_result] = "You win!"
      end
    elsif human_choice != computer_choice
      session[:result] = "Computer scores"
      session[:computer_score] = (session[:computer_score].to_i + 1).to_i
      if session[:computer_score] == 2
        session[:game_result] = "Computer wins!"
      end
    else
      session[:result] = "This round is a tie"
      session[:human_score] = (session[:human_score]).to_i
      session[:computer_score] = (session[:computer_score]).to_i
    end
  end

  game

  redirect "/"

  erb :rps, locals: { rock: params["Rock"],
                      paper: params["Paper"],
                      scissors: params["Scissors"],
                      result_message: result_message}
end

post "/reset" do
  session[:visit_count] = nil
  session[:human_score] = nil
  session[:computer_score] = nil
  session[:result_message] = nil
  session[:game_result] = nil

  redirect "/"
end
