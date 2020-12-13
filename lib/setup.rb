require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/ship'

class Setup
  attr_reader :computer,
              :player,
              :computer_board,
              :player_board,
              :ships


  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @computer = Computer.new(@computer_board)
    @player = Player.new(@player_board)

  end

  def collect_ships
    @ships = []
    @ships << Ship.new("Cruiser", 3)
    @ships << Ship.new( "Submarine", 2)
  end

  def give_ships
    collect_ships
    @player.ships = @ships
    collect_ships
    @computer.ships = @ships
  end



  def computer_place_ships
    @computer.ships.each do |ship|
      @computer.place_ship(ship, ship.length)
    end
  end

  def render_player_board
    @player.collect_ships

    p "(Computer): I have laid out my ships in the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."

    @player_board.render

    @player.ships.each do |ship|

      p "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
      p ">"

      while @player_board.place(ship, @player.player_input) == false
        p "Error: Those are invlaid coordinates. Please try again:"
        p ">"
      end
      @player_board.render(true)
    end
  end

  def setup
    give_ships
    computer_place_ships
    computer_board.render(true)
    render_player_board
  end
end
