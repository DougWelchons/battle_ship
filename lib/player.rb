class Player
  attr_accessor :ships
  attr_reader   :name,
                :stored_input

  def initialize(name)
    @name = name
    @ships = []
  end

  def player_input
    input = gets.chomp.upcase
    input.split.sort
  end

  def single_coordinate_input
    @stored_input = player_input
    if @stored_input.count == 1
      @stored_input = @stored_input[0]
    else
      "Z29"
    end
  end

  def has_lost?
    @ships.all? do |ship|
      ship.sunk?
    end
  end
end
