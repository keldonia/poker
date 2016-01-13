class TowersOfHanoi
    attr_reader :towers, :winset

  def initialize(towersize)
    @winset = (1..towersize).to_a.reverse
    @towers = {1 => @winset, 2 => [], 3 => []}
  end

  def move(from_tower, to_tower)

    if !towers[from_tower].empty? && !towers[to_tower].empty? &&
      towers[to_tower].last < towers[from_tower].last
      raise ImproperDiscPlacementError.new "move a larger disc on top of a smaller disc."
    elsif towers[from_tower].empty?
      raise ImproperDiscPlacementError.new "move a disc from an empty tower."
    end

    moved_disc = towers[from_tower].pop
    towers[to_tower] << moved_disc
  end

  def won?
    (towers[2] == winset || towers[3] == winset) && towers[1].empty?
  end

  def render
    "Tower 1: #{towers[1]}\nTower 2: #{towers[2]}\nTower 3: #{towers[3]}"
  end
end

class ImproperDiscPlacementError < StandardError
end
