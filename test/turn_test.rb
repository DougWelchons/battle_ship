require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/board'
require './lib/computer'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    computer_board = Board.new
    player_board = Board.new
    computer = Computer.new(computer_board)
    player = Player.new(player_board)
    turn = Turn.new(computer, computer_board, player, player_board)

    assert_instance_of Turn, turn
  end

  def test_for_player_shoots
    computer = mock
    player = mock
    computer_board = mock
    player_board = mock
    turn = Turn.new(computer, computer_board, player, player_board)

    player.stubs(:single_coordinate_input).returns("A1")
    computer_board.stubs(:valid_target?).returns(true)
    computer_board.expects(:fire_upon)
    player.expects(:stored_input)

    turn.player_shoots
  end
end
