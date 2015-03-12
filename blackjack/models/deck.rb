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

  def collection
    @collection
  end

end
