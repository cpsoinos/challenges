class Deck

  def initialize
    @collection = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end
    @collection.shuffle!
  end

  attr_reader :collection

  def deal!
    @collection.shift
  end

  def collection
    @collection
  end

end
