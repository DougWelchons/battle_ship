class Computer
  attr_accessor :ships
  attr_reader :computer_board


  def initialize(computer_board)
    @computer_board = computer_board
    @ships = []
    @keys = @computer_board.cells.keys
  end

############ PLACE SHIP METHODS ################
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
    starting_coordinate = @keys.sample
    coordinates = [starting_coordinate]
    (ship_length - 1).times do
      coordinates << "#{coordinates.last[0].next}#{coordinates.last[1]}"
    end
    coordinates
  end

  def horizontal_generator(ship_length)
    starting_coordinate = @keys.sample
    coordinates = [starting_coordinate]
    (ship_length-1).times do
      coordinates << "#{coordinates.last[0]}#{coordinates.last[1].to_i + 1}"
    end
    coordinates
  end


##################################################


########## FIRE AT BOARD METHODS #################
  def initial_targets
    @valid_targets = @keys.shuffle
  end

  def target
    @valid_target.shift
  end

##################################################
end
