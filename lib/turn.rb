class Turn

  def initialize(computer, computer_board, player, player_board)
    @computer = computer
    @computer_board = computer_board
    @player = player
    @player_board = player_board
  end

  def render_game_state
    puts "\n=============COMPUTER BOARD=============\n"
    @computer_board.render
    puts "\n==============PLAYER BOARD==============\n"
    @player_board.render(true)
  end

  def player_shoots
    puts "Enter the coordinate for your shot: \n"
    until @computer_board.valid_target?(validated_input)
      if @computer_board.valid_coordinate?(@input)
        puts "You have already fired on this coordinate."
      end
        puts "Please enter a valid coordinate: \n"
    end
      @computer_board.fire_upon(@input)
  end

  def computer_shoots
    @computer_target = @computer.target
    @player_board.fire_upon(@computer_target)
  end

  def summary
    puts "Your shot on #{@input} #{outcome(@computer_board, @input)}"
    puts "My shot on #{@computer_target} #{outcome(@player_board, @computer_target)}"
  end

  def outcome(board, target)
    if board.cells[target].render == "X"
      "sunk the #{board.cells[target].ship.name}."
    elsif board.cells[target].render == "H"
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

def validated_input
  @input = @player.player_input
  if @input.count == 1
    @input = @input[0]
  else
    "Z29"
  end
end
