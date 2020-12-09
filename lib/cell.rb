class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @print_to_screen = {[true, true, false] => "M",
                        [false, true, false] => "H",
                        [true, false, false] => ".",
                        [false, false, false] => ".",
                        [true, true, true] => "M",
                        [false, true, true] => "H",
                        [true, false, true] => ".",
                        [false, false, true] => "S"}
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
   @ship.hit if !empty?
   @fired_upon = true
  end
end









#   def render(cheat = false)
#     sunk? ? "X" : @prent_to_screen[[empty?, fired_upon?, cheat]]
#   end
#
# def render(cheat = false)
#   if sunk?
#     "X"
#   else
#   @prent_to_screen[[empty?, fired_on?, cheat]]
# end
#
#
# if sunk?
#   "x"
# elsif empty? && fired_upon?
#   "m"
# elsif if empty?
#   "."
# elsif fired_upon?
#   "h"
# elsif cheat == true
#   "s"
# else
#   "."
# end
#
