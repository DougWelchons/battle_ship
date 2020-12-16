require './lib/player'
require './lib/setup'

class MainMenu

  def initialize
    @player = Player.new("Bob Gu")
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
    if @player.stored_input == "Q"
      puts ""
      exit_game
    elsif @player.stored_input == 'P'
      puts ""
      the_game
    else
      puts "Sorry. Invalid entry. Please type 'p' to play or 'q' to quit:\n"
      print "> "
      options
    end
  end

  def the_game
    game = Setup.new(@player)
    game.setup
    loop do
      game.take_turn
      if game.computer.has_lost?
        puts "You won!\n"
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
