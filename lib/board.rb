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

  def each_coordinate_is_valid(coordinates)
    coordinates.all? do |coordinate|
      valid_coordinate?(coordinate)
    end
  end

  def valid_length?(ship, coordinates)
    ship.length == coordinates.count
  end

  def consecutive?(coordinates)
    if is_it_horizontal?(coordinates) == true
     true
   elsif is_it_vertical?(coordinates) == true
     true
    else
     false
    end
  end

  def is_it_horizontal?(coordinates)
    horizontal = []
    coordinates.each_cons(2) do |letter1, letter2|
      horizontal.push(letter1[0] == letter2[0])
      horizontal.push(letter1[1].to_i + 1 == letter2[1].to_i)
    end
    horizontal.all?
  end

  def is_it_vertical?(coordinates)
    vertical = []
    coordinates.each_cons(2) do |num1, num2|
      vertical.push(num1[1] == num2[1])
      vertical.push(num1[0].ord + 1 == num2[0].ord)
    end
    vertical.all?
  end

  def coordinates_empty?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def validate(ship, coordinates)
    return false if each_coordinate_is_valid(coordinates) == false
    return false if valid_length?(ship, coordinates) == false
    return false if consecutive?(coordinates) == false
    return false if coordinates_empty?(coordinates) == false
    true
  end

  def valid_placement?(ship, coordinates)
    if validate(ship, coordinates) == true
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    else
      "Sorry, not valid placement"
    end
  end

  def render(cheat = false)
    evaluate(cheat)
    print_board
  end

  def evaluate(cheat)
    @board = ""
    @cells.each_value do |value|
      @board << value.render(cheat)
      @board << " "
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
end
