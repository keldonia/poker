require 'rspec'
require 'spec_helper'
require 'array_tdd'

describe Array do
  let(:test_array_1) { [1, 2, 3, 4, 5, 5, 6] }
  let(:test_array_2) { [-1, 0, 2, -2, 1] }
  let(:test_matrix) { [
                        [0, 1, 2],
                        [3, 4, 5],
                        [6, 7, 8]
                      ]}
  let(:stock_days) { [213, 535, 132, 217, 832]}

  describe '#my_uniq' do
    let(:result) { test_array_1.my_uniq }

    it "removes duplicate elements in the array" do
      expect(result).to eq([1, 2, 3, 4, 5, 6])
    end

    it "does not alter the original array" do
      expect(result).not_to eq(test_array_1)
    end

  end

  describe '#two_sum' do
    let(:result) {test_array_2.two_sum}

    it "returns the indices of pairs of elements that sum to zero" do
      expect(result).to eq( [[0, 4], [2, 3]] )
    end

    it "returns indices pairs in order" do
      expect(result).not_to eq( [[2, 3], [0, 4]])
    end

    it "returns empty array if no pairs sum to zero" do
      expect(test_array_1.two_sum).to eq([])
    end

    it "does not return the same element twice" do
      expect(result).not_to eq([[0, 4], [1, 1], [2, 3]])
    end

  end

  describe '#my_transpose' do

    let(:result) {test_matrix.my_transpose}
    let(:correct_transposition) { [ [0, 3, 6],
                                    [1, 4, 7],
                                    [2, 5, 8]
                                ]}

    it "transposes the matrix" do
      expect(result).to eq(correct_transposition)
    end

    it "does not return the original array" do
      expect(result).not_to eq(test_matrix)
    end

    it "does not return a flattened array" do
      expect(result).not_to eq(correct_transposition.flatten)
    end

  end

  describe '#stock_picker' do
    #[213, 535, 132, 217, 832]
    let(:result) {stock_days.stock_picker}

    it "returns the most profitable pair of days to purchase then sell stock" do
      expect(result).to eq([2, 4])
    end

    it "returns the days in proper temporal order" do
      expect(result).not_to eq([2, 1])
    end

    it "returns days and not prices" do
      expect(result).not_to eq([132, 432])
    end

  end
end
