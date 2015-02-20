SELECTED_NUMBER = rand(1001)

def game
  @SELECTED_NUMBER = SELECTED_NUMBER
  puts "Guess a number between 1 and 1000:"
  guess = gets.chomp.to_i
  if guess == @SELECTED_NUMBER
    puts "Congratulations! You guessed the number!"
  elsif guess > @SELECTED_NUMBER
    puts "Too high, try again."
    game
  elsif guess < @SELECTED_NUMBER
    puts "Too low, try again."
    game
  end
end

game
