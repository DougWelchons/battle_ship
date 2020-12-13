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

  def test_if_computer_has_lost_the_game
    computer_board = Board.new
    computer = Computer.new(computer_board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer.ships << cruiser
    computer.ships << submarine

    assert_equal false, computer.has_lost?

    cruiser.hit
    cruiser.hit
    cruiser.hit

    assert_equal true, cruiser.sunk?

    submarine.hit
    submarine.hit

    assert_equal true, submarine.sunk?

    assert_equal true, computer.has_lost?
  end

  def test_it_can_remove_a_valid_targets_when_its_shot_at
    computer_board = Board.new
    computer = Computer.new(computer_board)

    assert_equal 16, computer.valid_targets.count

    computer.target

    assert_equal 15, computer.valid_targets.count
  end
end
