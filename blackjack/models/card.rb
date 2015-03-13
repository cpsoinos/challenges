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
    ["J", "Q", "K", "A"].include?(@value)
  end

  def card_score(card)
    score = 0
    if card.face_card?
      score = 10
    else
      score = card.value
    end
    score
  end

  def self.adjust_for_ace(score, cards)
    cards.each do |card|
      if card.value == "A"
        if score > 21
          score -= 9
        else
          score += 1
        end
      end
    end
    score
  end

end
