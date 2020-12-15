require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/ship'
require './lib/turn'


class Setup
  attr_reader :ships,
              :player,
              :computer

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @computer = Computer.new(@computer_board)
    @player = Player.new("Jason")
  end

  def give_ships
    players = [@computer, @player]
    players.each do |player|
      @ships = [Ship.new("Cruiser", 3), Ship.new( "Submarine", 2)]
      player.ships = @ships
    end
  end

  def computer_place_ships
    @computer.ships.each do |ship|
      @computer.place_ship(ship, ship.length)
    end
  end

  def prompt_player
    puts "(Computer): I have laid out my ships in the grid."
    puts "            You now need to lay out your two ships."
    puts "            The Cruiser is three units long and the"
    puts "            Submarine is two units long."
    sleep(2)
  end

  def player_setup
    prompt_player
    @player.ships.each do |ship|
      render_board(ship)
      place_ship(ship)
    end
  end

  def place_ship(ship)
    while @player_board.place(ship, @player.player_input) == false
      puts "Error: Those are invlaid coordinates. Please try again:"
      print "> "
    end
  end

  def render_board(ship)
    puts ""
    @player_board.render(true)
    puts "\nEnter the squares for the #{ship.name} (#{ship.length} spaces):"
    print "> "
  end

  def setup
    give_ships
    computer_place_ships
    player_setup
  end

  def take_turn
    turn = Turn.new(@computer, @computer_board, @player, @player_board)
    turn.take_turn
  end
end
