class Turn

  def initialize(computer, computer_board, player, player_board)
    @computer = computer
    @computer_board = computer_board
    @player = player
    @player_board = player_board
  end

  def render_game_state
    puts "\n=============COMPUTER BOARD============="
    @computer_board.render
    puts "\n==============PLAYER BOARD=============="
    @player_board.render(true)
  end

  def player_shoots
    puts "Enter the coordinate for your shot: "
    print "> "
    until @computer_board.valid_target?(@player.single_coordinate_input)
      error_message
    end
      @computer_board.fire_upon(@player.stored_input)
  end

  def error_message
    if @computer_board.valid_coordinate?(@player.stored_input)
      puts "You have already fired on this coordinate."
    end
    puts "Please enter a valid coordinate: "
    print "> "
  end

  def computer_shoots
    @player_board.fire_upon(@computer.target)
  end

  def summary
    puts "Your shot on #{@player.stored_input} #{outcome(@computer_board, @player.stored_input)}"
    puts "My shot on #{@computer.stored_input} #{outcome(@player_board, @computer.stored_input)}"
  end

  def outcome(board, target)
    targeted_cell = board.cells[target]
    if targeted_cell.render == "X"
      "sunk the #{targeted_cell.ship.name}."
    elsif targeted_cell.render == "H"
      "was a hit."
    else
      "was a miss."
    end
  end

  def take_turn
    render_game_state
    player_shoots
    computer_shoots
    summary
  end
end
