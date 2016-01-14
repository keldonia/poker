require_relative 'card.rb'

class Deck
  attr_reader :deck

  CARD_VALUES = {
    A: 13,
    K: 12,
    Q: 11,
    J: 10,
    10 => 9,
    9 => 8,
    8 => 7,
    7 => 6,
    6 => 5,
    5 => 4,
    4 => 3,
    3 => 2,
    2 => 1,
  }

  SUITS = ["♠", "♥", "♦", "♣"]

  def initialize
    @deck = []
    populate_deck
    @deck.shuffle!
  end

  def populate_deck
    SUITS.each do |suit|
      CARD_VALUES.each do |card_type, value|
        @deck << Card.new(card_type, suit, value)
      end
    end
  end

  def draw
    @deck.pop
  end

end
