class Player
  attr_reader :ships,
              :name,
              :stored_input

  def initialize(name)
    @name = name
    @ships = []
  end

  def player_input
    @stored_input = gets.chomp.upcase
    @stored_input.split.sort
  end

  def single_coordinate_input
    @stored_input = player_input
    if @stored_input.count == 1
      @stored_input = @stored_input[0]
    else
      "Z29"
    end
  end

  def add_ships(ships)
    @ships = ships
  end

  def has_lost?
    @ships.all? do |ship|
      ship.sunk?
    end
  end
end
