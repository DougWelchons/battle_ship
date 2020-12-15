require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/setup'

class SetupTest < Minitest::Test

  def test_it_exists
    setup = Setup.new

    assert_instance_of Setup, setup
  end

  def test_it_can_give_ships_to_the_computer_and_player
    setup = Setup.new

    setup.give_ships

    assert_equal 2, setup.player.ships.count
    assert_equal 2, setup.computer.ships.count
    refute_equal setup.computer.ships, setup.player.ships
  end
end
