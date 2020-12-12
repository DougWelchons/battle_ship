class Turn

  def initialize(computer, conputer_board, player, player_board)
    @computer = computer
    @computer_board = computer_board
    @player = player
    @player_computer = player_board
  end

  def render_game_state
    puts "=============COMPUTER BOARD============="
    computer_board.render
    puts "==============PLAYER BOARD=============="
    player_board.render(true)
  end

  def player_shoots
    puts "Enter the coordinate for your shot:"
    until computer_board.valid_target(player.player_input)
      #need to trigger a responce for coordinates that have alreay been fired upon
      puts "Please enter a valid coordinate:"
    end
      computer_board.fire_upon(player.input)
      @player_target = player.input
  end

  def computer_shoots
    @computer_target = computer.target
    player_board.fire_upon(@computer_target)
  end

  def summry
    puts "Your shot on #{@player_target} was #{outcome(@computer_board, @player_target)}"
    puts "My shot on #{@computer_target} was #{outcome(@player_board, @computer_target)}"
  end

  def outcome(board, target)
    if board.cells[target].render == "X"
      "sunk the #{board.cells[target].ship}."
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
    summry
end
