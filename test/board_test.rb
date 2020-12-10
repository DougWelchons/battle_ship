require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'

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

  def test_it_is_invalid_if_not_the_length_of_the_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_length?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_length?(submarine, ["A2", "A3", "A4"])
  end

  def test_it_is_valid_if_it_is_the_length_of_the_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_length?(cruiser, ["A1", "A2", "A3"])
    assert_equal true, board.valid_length?(submarine, ["B2", "C2"])
  end

  def test_it_is_invalid_if_on_a_diagonal
    board = Board.new

    assert_equal false, board.consecutive?(["A1", "B2", "C3"])
    assert_equal false, board.consecutive?(["C2", "D3"])
  end

  def test_it_is_valid_if_not_on_a_diagonal
    board = Board.new

    assert_equal true, board.consecutive?(["A1", "A2" "A3"])
    assert_equal true, board.consecutive?(["C2", "D2"])
  end

  def test_it_has_invalid_placements_in_non_consecutive_order
    board = Board.new

    assert_equal false, board.consecutive?(["A1", "A2", "A4"])
    assert_equal false, board.consecutive?(["C1", "B1"])
  end

  def test_it_has_valid_placements_in_consecutive_order
    board = Board.new

    assert_equal true, board.consecutive?(["A1", "A2", "A3"])
    assert_equal true, board.consecutive?(["B1", "C1"])
  end

  def test_it_validates_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    assert_equal false, board.valid_placement?(submarine, ["B2", "D2"])
  end

  def test_it_can_place_a_ship_in_multiple_cells
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal cruiser, board.cells["A1"].ship
    assert_equal cruiser, board.cells["A2"].ship
    assert_equal cruiser, board.cells["A3"].ship
  end
end
#
# def test_it_has_invalid_placements #overlaping
#   board = Board.new
#   cruiser = Ship.new("Cruiser", 3)
#   submarine = Ship.new("Submarine", 2)
#
#   assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
#   assert_equal false, board.valid_placement?(submarine, ["A2", "B2"])
# end
#
# def test_it_has_invalid_placements #partially off of the board
#   board = Board.new
#   cruiser = Ship.new("Cruiser", 3)
#   submarine = Ship.new("Submarine", 2)
#
#   assert_equal false, board.valid_placement?(cruiser, ["A3", "A4", "A5"])
#   assert_equal true, board.valid_placement?(submarine, ["B2", "C2"])
# end
#
