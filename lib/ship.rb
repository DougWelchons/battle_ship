
class Ship
  attr_reader :name, :length, :health

  def initialize(name, size)
    @name = name
    @length = size
    @health = size
  end

  def sunk?
    @health == 0

end
