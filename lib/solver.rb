class Solver
  attr_reader :board

  def initialize(puzzle_text)
    row_groups = puzzle_text.map {|row| row.chomp.rjust(9, " ")}
    @board = Board.new(row_groups)
  end

  def solve

  end

end

class Board
  attr_reader :rows, :columns, :sqaures

  def initialize(row_groups)
    @rows = (1..9).zip(row_groups).reduce({}) do |hash, group|
      hash[group.first] = Row.new(group.last)
      hash
    end
    @columns = (1..9).reduce({}) do |hash, key|
      hash[key] = Column.new(rows.map do |_, row|
          row.spots[key]
        end)
      hash
    end
    @squares =


  end


  # column 1-3 spots 1-3 = square 1  columns[1].spots.select[1-3], columns[2].spots.select[1-3]
  # column 4-6 spots 1-3 = square 2
  # column 7-9 spots 1-3 = square 3
  # column 1-3 spots 4-6 = square 4
  # column 4-6 spots 4-6 = square 5
  # column 7-9 spots 4-6 = square 6
  # column 1-3 spots 7-9 = square 7
  # column 4-6 spots 7-9 = square 8
  # column 7-9 spots 7-9 = square 9



  # turn spots into a hash
  # initialize new rows with corresponding spots
  # init new columns w/ corresponding spots
  # init new squares w/ corresponding spots
end

class Row
  attr_reader :spots

  def initialize(row)
    @spots = (1..9).zip(row.each_char).reduce({}) do |hash, value|
      hash[value.first] = Spot.new(value.last)
      hash
    end
  end
end

class Column
  attr_reader :spots

  def initialize(spots)
    @spots = (1..9).zip(spots).reduce({}) do |hash, spot|
      hash[spot.first] = spot.last
      hash
    end
  end
end

class Squares
  attr_reader :spots

  def initialize(spots)
    @spots = (1..9).zip(spots).reduce({}) do |hash, spot|
      hash[spot.first] = spot.last
      hash
    end
  end
end


class Spot
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def possiblities
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def locked?
    false if value == " "
  end
end
