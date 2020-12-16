class Computer
  attr_reader :computer_board,
              :stored_input,
              :ships

  def initialize(computer_board)
    @computer_board = computer_board
    @ships = []
    @valid_targets = computer_board.cells.keys.shuffle
  end

  def add_ships(ships)
    @ships = ships
  end

  def has_lost?
    @ships.all? do |ship|
      ship.sunk?
    end
  end

  def place_ship(ship, ship_length)
    while @computer_board.place(ship, generator(ship_length)) == false
    end
  end

  def generator(ship_length)
    placement = ["horizontal", "vertical"]
    if placement.sample == "vertical"
      vertical_generator(ship_length)
    else
      horizontal_generator(ship_length)
    end
  end

  def vertical_generator(ship_length)
    starting_coordinate = @computer_board.cells.keys.sample
    coordinates = [starting_coordinate]
    (ship_length - 1).times do
      coordinates << "#{coordinates.last[0].next}#{coordinates.last[1]}"
    end
    coordinates
  end

  def horizontal_generator(ship_length)
    starting_coordinate = @computer_board.cells.keys.sample
    coordinates = [starting_coordinate]
    (ship_length-1).times do
      coordinates << "#{coordinates.last[0]}#{coordinates.last[1].to_i + 1}"
    end
    coordinates
  end

  def target
    @stored_input = @valid_targets.shift
  end
end
