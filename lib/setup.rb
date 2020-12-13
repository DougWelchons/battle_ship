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
    # @player.collect_ships

    puts "(Computer): I have laid out my ships in the grid."
    puts "            You now need to lay out your two ships."
    puts "            The Cruiser is three units long and the"
    puts "            Submarine is two units long."

    @player_board.render

    @player.ships.each do |ship|

      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
      print "> "

      while @player_board.place(ship, @player.player_input) == false
        puts "Error: Those are invlaid coordinates. Please try again:"
        print "> "
      end
      @player_board.render(true)
    end
  end

  def setup
    give_ships
    computer_place_ships
    render_player_board
  end

  def take_turn
    turn = Turn.new(@computer, @computer_board, @player, @player_board)
    turn.take_turn
  end

  def intro
    puts ""
    puts "-----------------------------------------"
    puts "          Welcome to BATTLESHIP          "
    puts "Please enter 'p' to play, or 'q' to quit:"
    puts "-----------------------------------------"
    print "> "
    options
  end

  def options
    @player.player_input
    if @player.input == "Q"
      puts ""
      exit_game
    elsif @player.input == 'P'
      puts ""
      the_game
    else
      puts "Sorry. Invalid entry. Please type 'p' to play or 'q' to quit:\n"
      print "> "
      options
    end
  end

  def the_game
    setup
    loop do
      take_turn
      if computer.has_lost?
        puts "You won!\n"
        intro
        break
      elsif player.has_lost?
        puts "I won!\n"
        intro
        break
      end
    end
  end

  def exit_game
    puts "Sorry to see you go. Goodbye!"
    puts ""
  end
end
