class Hand

  def initialize(name, deck)
    @hand = []
    @name = name
    @deck = deck
  end

  attr_accessor :hand, :name, :deck

  def draw(card)
    @hand << card
  end

  def hand_score
    result = 0
    @hand.each do |card|
      result += (card.card_score(card)).to_i
    end
    result
  end

  def prompt
    result = ""
    print "Hit or stand (H/S)?: "
    response = gets.chomp.downcase
    if response == "h" || response == "hit"
      new_card = draw(deck.deal!).last
      puts "Player was dealt #{new_card.value} of #{new_card.suit}."
      puts "Player's hand score: #{hand_score}"
    elsif response == "s" || response == "stand"
      result = "stand"
    else
      puts "Stop being a dick and use a letter."
    end
    result
  end

  def blackjack?(name)
    if hand.length == 2 && hand_score == 21
      abort "Blackjack! #{name} wins."
    end
  end

  def bust?(name)
    if hand_score > 21
      abort "BUST! #{name} wins."
    end
  end

  def to_s
    result = ""
    hand.each do |card|
      result += "#{name} was dealt #{card.value} of #{card.suit}.\n"
    end
    result
  end

end
