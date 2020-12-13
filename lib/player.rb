class Player
  attr_accessor :ships
  attr_reader :name,
              :input

  def initialize(name)
    @name = name
    @ships = []
  end

  def player_input
    @input = gets.chomp.upcase
    @input.split.sort
  end

  def has_lost?
    @ships.all? do |ship|
      ship.sunk?
    end
  end
end
