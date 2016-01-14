module CardValues

  CARD_VALUES = {
    A: [0, 13],
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

  def card_values
    CARD_VALUES
  end

  def suits
    SUITS
  end

end
