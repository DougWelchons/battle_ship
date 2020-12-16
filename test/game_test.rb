require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    player = Player.new("Mike Dao")
    game = Game.new(player)

    assert_instance_of Game, game
  end

  def test_it_can_give_ships_to_the_computer_and_player
    player = Player.new("Bob Gu")
    game = Game.new(player)


    game.give_ships

    assert_equal 2, game.player.ships.count
    assert_equal 2, game.computer.ships.count
    refute_equal game.computer.ships, game.player.ships
  end
end
