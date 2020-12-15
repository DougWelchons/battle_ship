require './lib/player'
require './lib/setup'

class MainMenu

  def initialize
    @player = Player.new("player")
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
    game = Setup.new
    game.setup
    loop do
      game.take_turn
      if game.computer.has_lost?
        puts "You won!\n"
        intro
        break
      elsif game.player.has_lost?
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