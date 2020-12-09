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

  def test_it_has_valid_placements
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    assert_equal true, board.valid_placement?(submarine, ["B2", "C2"])
  end

  def test_it_has_invalid_placements #overlaping
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    assert_equal true, board.valid_placement?(submarine, ["A2", "B2"])
  end

  def test_it_has_invalid_placements #partially off of the board
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A3", "A4", "A5"])
    assert_equal true, board.valid_placement?(submarine, ["B2", "C2"])
  end

  def test_it_has_invalid_placements #nonsequential cells
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal true, board.valid_placement?(submarine, ["B2", "C2"])
  end

end
