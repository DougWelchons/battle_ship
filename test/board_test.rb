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

  def test_if_each_coordinate_is_valid
    board = Board.new

    assert_equal true, board.each_coordinate_is_valid(["A1", "A2", "A3"])
    assert_equal false, board.each_coordinate_is_valid(["B1", "Z1"])
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

  def test_is_it_horizontal?
    board = Board.new

    assert_equal true, board.is_it_horizontal?(["A1", "A2", "A3"])
    assert_equal false, board.is_it_horizontal?(["A1", "B1", "C1"])
  end

  def test_is_it_vertical?
    board = Board.new

    assert_equal true, board.is_it_vertical?(["A1", "B1", "C1"])
    assert_equal false, board.is_it_vertical?(["A1", "A2", "A3"])
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

  def test_it_can_have_empty_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    assert_equal true, board.coordinates_empty?(["A1", "B1", "C1"])

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal false, board.coordinates_empty?(["A1", "B1", "C1"])
  end

  def test_it_cannot_overlap_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal "Error: Invalid placement please try again.", board.place(submarine, ["A2", "B2"])
  end

  def test_it_evaluates_the_board_status
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["B2", "C2"])

    board.cells["A1"].fire_upon
    board.cells["A2"].fire_upon
    board.cells["A3"].fire_upon
    board.cells["C2"].fire_upon
    board.cells["D4"].fire_upon

    assert_equal "X X X . . . . . . H . . . . . M ", board.evaluate(false)
    assert_equal "X X X . . S . . . H . . . . . M ", board.evaluate(true)
  end
end
