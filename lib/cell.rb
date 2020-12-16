class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @print_to_screen = {
                        [true,  false, false, false] => ".",
                        [false, false, false, false] => ".",
                        [true,  true,  false, false] => "M",
                        [false, true,  false, false] => "H",
                        [false, true,  true,  false] => "X",
                        [true,  false, false, true] => ".",
                        [false, false, false, true] => "S",
                        [true,  true,  false, true] => "M",
                        [false, true,  false, true] => "H",
                        [false, true,  true,  true] => "X"
                        }
  end

  def empty?
    @ship.nil?
  end

  def fired_upon?
    @fired_upon
  end

  def sunk?
    return false if @ship.nil?
    @ship.sunk?
  end

  def render(reveal = false)
    @print_to_screen[[empty?, fired_upon?, sunk?, reveal]]
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
   @ship.hit if !empty?
   @fired_upon = true
  end
end
