require 'rspec'
require 'spec_helper'
require 'poker.rb'
require 'card.rb'
require 'deck.rb'
require 'hand.rb'
require 'player.rb'

describe Poker do

  describe Deck do
    let(:stack_of_cards) { Deck.new.deck }
    let(:cards) { stack_of_cards.map{ |card| card.to_s } }
    # let(:cards) { stack_of_cards.map{ |card| [card.value, card.suit] } }

    it "contains 52 cards" do
      expect(stack_of_cards.count).to eq(52)
    end

    it "does not contain any duplicate cards" do
      random_pos = rand(53)
      card_1 = stack_of_cards[random_pos]
      card_1_values = card_1.to_s
      # card_1_values = [card_1.value, card_1.suit]

      cards.delete_at(random_pos)

      expect(cards.include?(card_1_values)).to be_falsey
    end

    it "contains shuffled cards" do
      expect(cards).not_to eq(cards.sort)
    end

    describe '#draw' do

      it "removes a card from the top of the deck" do
        original_stack = subject.deck
        subject.draw

        expect(original_stack.take(51)).to eq(subject.deck)
      end

    end

  end

  describe Card do

    it "prints out the value and suit of the card" do
      card = Card.new(6, "♦", 5)
      expect(card.to_s).to eq("6♦")
    end
  end


  describe Hand do
    let(:deck) { Deck.new }
    let(:player_hand) { (1..5).map{ deck.draw } }
    let(:hand) {Hand.new(player_hand)}

    describe '#high_card' do
      it "will return the card with the highest value" do
        hand_max = player_hand.map { |card| card.value }.max
        expect(hand.high_card(player_hand).value).to eq(hand_max)
      end
    end

    describe '#pairs' do
      let(:no_pair) { [ Card.new(:J, "♣", 10) ] }
      let(:single_pair) { (1..2).map { Card.new(:J, "♣", 10) } }
      let(:double_pairs) { (1..2).map { Card.new(:J, "♣", 10) } + (1..2).map { Card.new(:Q, "♣", 11) } }

      it "returns empty array if there are no pairs" do
        expect(Hand.new(no_pair).pairs).to eq([])
      end

      it "returns a single pair" do
        expect(Hand.new(single_pair).pairs).to eq(single_pair)
      end

      it "returns two pairs" do
        expect(Hand.new(double_pairs).pairs).to eq(double_pairs)
      end

    end

    describe '#three_of_a_kind' do
      let(:no_pair) { [ Card.new(:J, "♣", 10) ] }
      let(:threes) { (1..3).map { Card.new(:J, "♣", 10) } }

      it "returns empty array if there are no pairs" do
        expect(Hand.new(no_pair).three_of_a_kind).to eq([])
      end

      it "returns a three of a kind" do
        expect(Hand.new(threes).three_of_a_kind).to eq(threes)
      end
    end

    describe '#flush?' do
      let(:no_pair) { [ Card.new(:J, "♣", 10) ] }
      let(:flush) { (1..5).map { Card.new(:J, "♣", 10) } }

      it "returns empty array if there are no pairs" do
        expect(Hand.new(no_pair).flush?).to be_falsey
      end

      it "returns a three of a kind" do
        expect(Hand.new(flush).flush?).to be_truthy
      end
    end

    describe '#straight?' do
      let(:no_pair) { [ Card.new(:J, "♣", 10) ] }
      let(:straight) { (1..5).map { |val| Card.new(:J, "♣", val) } }

      it "returns empty array if there are no pairs" do
        expect(Hand.new(no_pair).straight?).to be_falsey
      end

      it "returns a three of a kind" do
        expect(Hand.new(straight).straight?).to be_truthy
      end
    end

  end
end
