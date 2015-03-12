class Card

SUITS  = ["♠", "♥", "♦", "♣"]
VALUES = ["2", "3", "4", "5", "6", "7", "8",
          "9", "10", "J", "Q", "K", "A"]

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  attr_reader :value, :suit

  def face_card?
    ["J", "Q", "K"].include?(@value)
  end

  def card_score(card)
    score = 0
    if card.face_card?
      score = 10
    elsif card.value == "A"
      score = 11
    else
      score = card.value
    end
    score
  end

end
