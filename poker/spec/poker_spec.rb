require 'rspec'
require 'spec_helper'
require 'poker.rb'
require 'card.rb'
require 'deck.rb'
require 'hand.rb'
require 'player.rb'
require 'card_values.rb'

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
      card = Card.new(6,"♦")
      expect(card.to_s).to eq("6♦")
    end
  end
end
