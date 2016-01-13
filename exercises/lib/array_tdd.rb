class Array

  def my_uniq
    unique_array = []
    self.each { |el| unique_array << el unless unique_array.include?(el) }
    unique_array
  end

  def two_sum
    pairs = []

    self.each_index do |i|
      (i + 1...size).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end

    pairs
  end

  def my_transpose
    transposed_array = []
    self.each_index do |i|
      row = []
      self.each_index do |j|
        row << self[j][i]
      end
      transposed_array << row
    end

    transposed_array
  end

  def stock_picker
    days, difference = [], 0

    self.each_index do |i|
      (i + 1...size).each do |j|
        daily_difference = self[j] - self[i]
        if daily_difference > difference
          days, difference = [i, j], daily_difference
        end
      end
    end

    days
  end

end
