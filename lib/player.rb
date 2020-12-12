class Player
  attr_reader :name,
              :input,
              :sorted_input,
              :ships

  def initialize(name)
    @name = name
    @ships = []
  end

  def player_input
    @input = gets.chomp.upcase
    @sorted_input = @input.split.sort
  end

  def has_lost?
    @ships.all? do |ship|
      ship.sunk?
    end
  end
end
