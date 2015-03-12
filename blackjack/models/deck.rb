class Deck

  def initialize
    @collection = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end
    @collection.shuffle!
  end

  attr_reader :collection

  def deal!
    @collection.pop
  end

  def collection # getter, gives us access to the state of the collection
    @collection
  end

  # def deal!
  #   @hand = Hand.new.hand
  #   2.times do
  #     @hand << draw!
  #   end
  #   @hand
  # end

end
