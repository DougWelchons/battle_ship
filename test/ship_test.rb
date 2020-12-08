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

  def test_it_is_not_sunk_by_default
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cruiser.sunk?
  end

  # def test_it_has_sunk
  #  cruiser = Ship.new("Cruiser", 3)
  #
  # end
  # assert_equal true, cruiser.sunk?
  # cruiser.hit
  # cruiser.hit
  # cruiser.hit
  #
  # assert_equal true, cruiser.sunk?
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
