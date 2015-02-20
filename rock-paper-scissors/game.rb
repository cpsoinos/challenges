player_score   = 0
computer_score = 0
shapes = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors' }

until player_score >= 2 || computer_score >= 2
  puts "Player Score: #{player_score}, Computer Score: #{computer_score}"
  puts "Choose rock (r), paper (p), or scissors (s):"
  player_shape = gets.chomp

  until player_shape == 'r' || player_shape == 'p' || player_shape == 's'
    puts "Invalid entry, try again."
    player_shape = gets.chomp
  end

  puts "Player chose #{shapes[player_shape]}."

  computer_shape = shapes.keys.sample
  puts "Computer chose #{shapes[computer_shape]}."

  if (player_shape == 'r' && computer_shape == 's') ||
     (player_shape == 'p' && computer_shape == 'r') ||
     (player_shape == 's' && computer_shape == 'p')
    puts shapes[player_shape].capitalize + ' beats ' + shapes[computer_shape] +
      '. Player wins this round.'
    player_score += 1
  elsif player_shape != computer_shape
    puts shapes[computer_shape].capitalize + ' beats ' + shapes[player_shape] +
      '. Computer wins this round.'
    computer_score += 1
  else
    puts "Tie, choose again."
  end
  puts
end

if player_score > computer_score
  puts "Player wins!"
else
  puts "Computer wins!"
end
