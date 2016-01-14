class Hand
  attr_reader :player_hand

  def initialize(player_hand)
    @player_hand = player_hand
  end

  def high_card(current_hand)
    max_value, high_card = 0, nil
    current_hand.each do |card|
      max_value, high_card = card.value, card if card.value > max_value
    end

    high_card
  end

  def matching(num)
    matches = Hash.new { |h, k| h[k] = Array.new }
    player_hand.each{ |card| matches[card.value] << card }

    matches.select { |card_value, card| card.count == num }
  end

  def pairs
    matching(2).values.flatten
  end

  def three_of_a_kind
    matching(3).values.flatten
  end

  def four_of_a_kind
    matching(4).values.flatten
  end

  def flush?
    matches = Hash.new { |h, k| h[k] = Array.new }
    player_hand.each{ |card| matches[card.suit] << card }

    matched_hash = matches.select { |card_suit, card| card.count == 5 }
    matched_hash.values.flatten != []
  end

  def straight?
    card_values = player_hand.map{ |card| card.value }.sort
    card_values.last - card_values.first == 4
  end

end
