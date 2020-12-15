require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/board'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new("Sara")

    assert_instance_of Player, player
  end

  def test_if_player_has_lost_the_game
    player = Player.new("Sara")
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    player.ships << cruiser
    player.ships << submarine

    assert_equal false, player.has_lost?

    cruiser.hit
    cruiser.hit
    cruiser.hit

    assert_equal true, cruiser.sunk?

    submarine.hit
    submarine.hit

    assert_equal true, submarine.sunk?

    assert_equal true, player.has_lost?
  end

  def test_single_coordinate_input
    player = Player.new("james")

    player.stubs(:player_input).returns(["A1"])

    assert_equal "A1", player.single_coordinate_input
  end
end
