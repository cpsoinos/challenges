require 'pry'
require_relative 'models/card'
require_relative 'models/deck'
require_relative 'models/hand'

deck = Deck.new
player = Hand.new("Player")
dealer = Hand.new("Dealer")

2.times do
  player.draw(deck.deal!)
  dealer.draw(deck.deal!)
end

puts player
puts "Player's hand score: #{player.hand_score}"
puts
puts "Dealer's first card is #{dealer.hand.first.value} of #{dealer.hand.first.suit}."
puts

if dealer.blackjack?("Dealer")
  abort("Dealer's second card is #{dealer.hand.last.value} of #{dealer.hand.last.suit}.")
elsif player.blackjack?("Player")
  abort("Nice job. You win big.")
end

###################
## PLAYER'S TURN ##
###################

until player.bust?
  current_prompt = player.prompt
  puts
  if current_prompt == "s"
    break
  elsif current_prompt == "h"
    new_card = player.draw(deck.deal!)
    puts "Player was dealt #{new_card.last.value} of #{new_card.last.suit}."
    puts "Player's hand score: #{player.hand_score}"
  else
    puts "Stop being a dick and use a letter."
  end
end

###################
## DEALER'S TURN ##
###################

if player.bust?
  abort "BUST! Dealer wins."
end

# binding.pry
puts "Dealer's second card is #{dealer.hand.last.value} of #{dealer.hand.last.suit}."
puts "Dealer's hand score: #{dealer.hand_score}"
puts

while dealer.hand_score < 17
  new_card = dealer.draw(deck.deal!).last
  puts "Dealer was dealt #{new_card.value} of #{new_card.suit}."
  puts "Dealer's hand score: #{dealer.hand_score}"
  puts
end

if dealer.bust?
  puts "BUST! Player wins."
elsif dealer.hand_score > player.hand_score
  puts "Dealer wins."
elsif player.hand_score > dealer.hand_score
  puts "Player wins."
else
  puts "Push."
end
