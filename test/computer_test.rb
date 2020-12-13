require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exits
    computer_board = Board.new
    computer = Computer.new(computer_board)

    assert_instance_of Computer, computer
  end

  def test_it_has_readable_attributes
    computer_board = Board.new
    computer = Computer.new(computer_board)

    assert_equal [], computer.ships
  end

  def test_it_has_a_ship_placed_on_the_computer_board
    computer_board = Board.new
    computer = Computer.new(computer_board)
    cruiser = Ship.new("Cruiser", 3)

    computer.place_ship(cruiser, 3)

    assert_equal 3, computer.computer_board.evaluate(true).scan(/S/).count
  end
end
