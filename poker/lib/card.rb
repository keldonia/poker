class Card
  attr_reader :card_type, :value, :suit

  def initialize(card_type, suit, value)
    @card_type = card_type
    @value = value
    @suit = suit
  end

  def to_s
    "#{card_type}" + suit
  end
end
