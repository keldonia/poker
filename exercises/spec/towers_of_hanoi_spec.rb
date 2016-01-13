require 'rspec'
require 'spec_helper'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:towers) { TowersOfHanoi.new(3) }

  describe '#move' do

    it "removes a disc from the first selected tower" do
      towers.move(1, 2)
      expect(towers.towers[1]).to eq([3, 2])
    end

    it "adds a disc to the second selected tower" do
      towers.move(1, 2)
      expect(towers.towers[2]).to eq([1])
    end

    it "does not move a larger disc on top of a smaller disc" do
      towers.move(1, 2)

      expect do
        towers.move(1, 2)
      end.to raise_error(ImproperDiscPlacementError)

    end

    it "does not move from an empty tower" do
      expect do
        towers.move(2, 1)
      end.to raise_error(ImproperDiscPlacementError)
    end

  end

  describe '#won?' do
    it "checks to see that the game is won" do
      towers.towers[1] = []
      towers.towers[3] = [3,2, 1]
      expect(towers.won?).to be_truthy
    end

    it "does not count the first tower as winning" do
      expect(towers.won?).to be_falsey
    end
  end

  describe '#render' do

    it "displays the current game state to user" do
      expect(towers.render).to eq("Tower 1: [3, 2, 1]\nTower 2: []\nTower 3: []")
    end

    it "changes to a new a new display following a move" do
      towers.move(1,2)
      expect(towers.render).to eq("Tower 1: [3, 2]\nTower 2: [1]\nTower 3: []")
    end

  end
end
