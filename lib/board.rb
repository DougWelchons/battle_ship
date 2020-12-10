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

  def coordinate(coordinates)
    @split_array = []
    coordinates.each do |coor|
      @split_array << coor.split("")
    end
  end

  def break_apart
    @letters = []
    @numbers = []

    @split_array.each do |coor|
      @letters << coor[0]
      @numbers << coor[1]
    end
  end

  def is_it_horizontal?
    horizontal = []
    @letters.each_cons(2) do |letter1, letter2|
      horizontal << (letter1 == letter2)
    end
    @numbers.each_cons(2) do |num1, num2|
     horizontal << (num1.to_i + 1 == num2.to_i)
    end
    horizontal
  end

  def is_it_vertical?
    vertical = []
   @numbers.each_cons(2) do |num1, num2|
    vertical << (num1 == num2)
   end
   @letters.each_cons(2) do |letter1, letter2|
    vertical << (letter1.ord + 1 == letter2.ord)
   end
   vertical
  end

  def consecutive?(coordinates)
    coordinate(coordinates)
    break_apart
    if is_it_horizontal? == [true, true] || is_it_horizontal? == [true, true, true, true]
     true
    elsif is_it_vertical? == [true, true] || is_it_vertical? == [true, true, true, true]
     true
    else
     false
    end
  end

  def valid_placement?(ship, coordinates)
    if each_coordinate_is_valid(coordinates) &&
       valid_length?(ship, coordinates) &&
       consecutive?(coordinates)
      true
    else
      false
    end
  end
end
