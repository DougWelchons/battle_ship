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
   cell = Cell.new("B4")

   assert_equal false, cell.fired_upon?
  end

  def test_it_has_been_fired_upon
   cell = Cell.new("B4")

   cell.fire_upon

   assert_equal true, cell.fired_upon?
  end

  def test_it_does_not_render_ship_by_default
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    cell.place_ship(cruiser)

    assert_equal false, cell.empty?
    assert_equal ".", cell.render
  end

  def test_it_renders_if_it_has_not_been_fired_upon
    cell = Cell.new("B4")

    assert_equal ".", cell.render
  end

  def test_it_renders_if_it_has_been_fired_upon_but_does_not_contain_a_ship
    cell = Cell.new("B4")

    cell.fire_upon

    assert_equal "M", cell.render
  end

  def test_it_has_been_fired_upon_and_contains_a_ship
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("C3")

    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal "H", cell.render
    assert_equal false, cruiser.sunk?
  end

  def test_it_can_reveal_a_ship_in_the_cell_when_not_fired_upon
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("C3")

    cell.place_ship(cruiser)

    assert_equal "S", cell.render(true)
  end

  def test_it_has_been_fired_upon_and_ship_has_sunk
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("C3")

    cell.place_ship(cruiser)
    cruiser.hit
    cruiser.hit
    cell.fire_upon

    assert_equal "X", cell.render
    assert_equal true, cruiser.sunk?
  end
end
