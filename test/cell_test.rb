require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_a_cell_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_it_is_empty
    cell = Cell.new("B4")

    assert_nil cell.ship
    assert_equal true, cell.empty?
  end


  def test_it_contains_a_ship
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    cell.place_ship(cruiser)

    assert_equal cruiser, cell.ship
    assert_equal false, cell.empty?
  end

  def test_it_has_not_been_fired_upon_by_default
   cruiser = Ship.new("Cruiser", 3)
   cell = Cell.new("B4")

   cell.place_ship(cruiser)

   assert_equal false, cell.fired_upon?
  end

  def test_it_has_been_fired_upon
   cruiser = Ship.new("Cruiser", 3)
   cell = Cell.new("B4")

   cell.place_ship(cruiser)

   assert_equal false, cell.fired_upon?

   cell.fire_upon

   assert_equal true, cell.fired_upon?
  end
end
