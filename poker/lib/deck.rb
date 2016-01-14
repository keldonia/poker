require_relative 'card.rb'
require_relative 'card_values.rb'

class Deck
  include CardValues

  attr_reader :deck

  def initialize
    @deck = []
    populate_deck
    @deck.shuffle!
  end

  def populate_deck
    self.suits.each do |suit|
      self.card_values.each do |card_type, value|
        @deck << Card.new(card_type, suit)
      end
    end
  end

  def draw
    @deck.pop
  end

end
