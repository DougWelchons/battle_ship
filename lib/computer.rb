class Computer
  attr_reader :computer_board,
              :ships,
              :stored_input,
              :valid_targets

  def initialize(computer_board)
    @computer_board = computer_board
    @ships = []
    @valid_targets = computer_board.cells.keys.shuffle
  end

  def has_lost?
    @ships.all? do |ship|
      ship.sunk?
    end
  end

  def add_ships(ships)
    @ships = ships
  end

  def place_ship(ship, ship_length)
    while @computer_board.place(ship, coordinates_generator(ship_length)) == false
    end
  end

  def coordinates_generator(ship_length)
    placement = ["horizontal", "vertical"]
    if placement.sample == "vertical"
      vertical_coordinates_generator(ship_length)
    else
      horizontal_coordinates_generator(ship_length)
    end
  end

  def vertical_coordinates_generator(ship_length)
    coordinates = [@computer_board.cells.keys.sample]
    (ship_length - 1).times do
      coordinates << "#{coordinates.last[0].next}#{coordinates.last[1]}"
    end
    coordinates
  end

  def horizontal_coordinates_generator(ship_length)
    coordinates = [@computer_board.cells.keys.sample]
    (ship_length - 1).times do
      coordinates << "#{coordinates.last[0]}#{coordinates.last[1].to_i + 1}"
    end
    coordinates
  end

  def target
    @stored_input = @valid_targets.shift
  end
end
