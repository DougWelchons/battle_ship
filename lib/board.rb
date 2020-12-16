require './lib/cell'

class Board
  attr_reader :cells

  def initialize
    @cells = {
              "A1" => Cell.new("A1"),
              "A2" => Cell.new("A2"),
              "A3" => Cell.new("A3"),
              "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"),
              "B2" => Cell.new("B2"),
              "B3" => Cell.new("B3"),
              "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"),
              "C2" => Cell.new("C2"),
              "C3" => Cell.new("C3"),
              "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"),
              "D2" => Cell.new("D2"),
              "D3" => Cell.new("D3"),
              "D4" => Cell.new("D4")
             }
  end

  def valid_coordinate?(coordinate)
    @cells[coordinate] != nil
  end

  def all_coordinates_are_valid?(coordinates)
    coordinates.all? do |coordinate|
      valid_coordinate?(coordinate)
    end
  end

  def coordinates_equal_to_ship_length?(ship, coordinates)
    ship.length == coordinates.count
  end

  def all_coordinates_are_consecutive?(coordinates)
    return true if is_it_horizontal?(coordinates) == true
    return true if is_it_vertical?(coordinates) == true
    false
  end

  def is_it_horizontal?(coordinates)
    horizontal = []
    coordinates.each_cons(2) do |coordinate1, coordinate2|
      horizontal.push(
                      (coordinate1[0] == coordinate2[0]),
                      (coordinate1[1].to_i + 1 == coordinate2[1].to_i)
                    )
    end
    horizontal.all?
  end

  def is_it_vertical?(coordinates)
    vertical = []
    coordinates.each_cons(2) do |coordinate1, coordinate2|
      vertical.push(
                    (coordinate1[1] == coordinate2[1]),
                    (coordinate1[0].ord + 1 == coordinate2[0].ord)
                   )
    end
    vertical.all?
  end

  def coordinates_are_empty?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def valid_placement?(ship, coordinates)
    return false if all_coordinates_are_valid?(coordinates) == false
    return false if coordinates_equal_to_ship_length?(ship, coordinates) == false
    return false if all_coordinates_are_consecutive?(coordinates) == false
    return false if coordinates_are_empty?(coordinates) == false
    true
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    else
      false
    end
  end

  def render(reveal = false)
    evaluate(reveal)
    print_board
  end

  def evaluate(reveal)
    @board = ""
    @cells.each_value do |value|
      @board += value.render(reveal)
      @board += " "
    end
    @board
  end

  def print_board
    puts "  1 2 3 4 \n" +
         "A #{@board[0..7]} \n" +
         "B #{@board[8..15]} \n" +
         "C #{@board[16..23]} \n" +
         "D #{@board[24..31]} \n"
  end

  def valid_target?(target)
    if valid_coordinate?(target)
      !@cells[target].fired_upon?
    end
  end

  def fire_upon(target)
    @cells[target].fire_upon
  end
end
