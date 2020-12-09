require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_16_cells
    board = Board.new

    assert_equal 16, board.cells.count
  end

  def test_it_has_valid_coordinate
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
  end

  def test_it_has_invalid_coordinate
    board = Board.new

    assert_equal false, board.valid_coordinate?("C5")
  end

end
