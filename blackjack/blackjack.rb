require 'pry'
require_relative 'models/card'
require_relative 'models/deck'
require_relative 'models/hand'

deck = Deck.new
player = Hand.new("Player", deck)
dealer = Hand.new("Dealer", deck)


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


until player.bust?("Dealer")
  if player.prompt == "stand"
    break
  end
  puts
end

if player.bust?("Dealer")
  abort
end

###################
## DEALER'S TURN ##
###################

puts dealer
puts "Dealer's hand score: #{dealer.hand_score}"

while dealer.hand_score < 17
  new_card = dealer.draw(deck.deal!).last
  puts "Dealer was dealt #{new_card.value} of #{new_card.suit}."
  puts "Dealer's hand score: #{dealer.hand_score}"
end

if dealer.hand_score > 21
  puts "BUST! Player wins."
elsif dealer.hand_score > player.hand_score
  puts "Dealer wins."
elsif player.hand_score > dealer.hand_score
  puts "Player wins."
else
  puts "Push."
end
