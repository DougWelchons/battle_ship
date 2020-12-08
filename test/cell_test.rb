require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end



# def_test_it_has_a_cell_coordinate
  #cell = Cell.new("B4")

  #assert_equal "B4", cell.coordinate

  #pry(main)> cell.ship
  # => nil

  #pry(main)> cell.empty?
  # => true

  # pry(main)> cruiser = Ship.new("Cruiser", 3)
  # => #<Ship:0x00007f84f0891238...>

  # pry(main)> cell.place_ship(cruiser)

  # pry(main)> cell.ship
  # => #<Ship:0x00007f84f0891238...>

  # pry(main)> cell.empty?
  # => false

end
