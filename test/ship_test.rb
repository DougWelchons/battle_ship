require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_name
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
  end

  def test_it_has_a_length
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.length
  end

  def test_it_starts_with_health
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
  end
  #
  # pry(main)> cruiser.sunk?
  # #=> false
  #
  # pry(main)> cruiser.hit
  #
  # pry(main)> cruiser.health
  # #=> 2
  #
  # pry(main)> cruiser.hit
  #
  # pry(main)> cruiser.health
  # #=> 1
  #
  # pry(main)> cruiser.sunk?
  # #=> false
  #
  # pry(main)> cruiser.hit
  #
  # pry(main)> cruiser.sunk?
  # #=> true


end