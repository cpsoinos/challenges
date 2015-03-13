class Hand

  def initialize(name)
    @hand = []
    @name = name
  end

  attr_accessor :hand, :name, :deck

  def draw(card)
    @hand << card
  end

  def raw_score
    result = 0
    hand.each do |card|
      result += (card.card_score(card)).to_i
    end
    result
  end

  def hand_score
    Card.adjust_for_ace(raw_score, hand)
  end

  def prompt
    response = ""
    print "Hit or stand (H/S)?: "
    response = gets.chomp.downcase
  end

  def blackjack?(name)
    if hand.length == 2 && hand_score == 21
      abort "Blackjack! #{name} wins."
    end
  end

  def bust?
    hand_score > 21
  end

  def to_s
    result = ""
    hand.each do |card|
      result += "#{name} was dealt #{card.value} of #{card.suit}.\n"
    end
    result
  end

end
