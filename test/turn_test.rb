require 'minitest/autorun'
require 'minitest/pride'
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
    board = Board.new
    turn = Turn.new(computer, computer_board, player, player_board)

    assert_instance_of Turn, turn
  end
end
