require_relative 'card_values.rb'

class Hand
  attr_reader :player_hand

  def initialize(player_hand)
    @player_hand = player_hand
  end


end
