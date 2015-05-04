class Solver

  def initialize(puzzle_text)
    row_groups = puzzle_text.map {|row| row.chomp.rjust(9, " ")}
    @board = Board.new(row_groups)
  end

  def solve

  end

end

class Board
  attr_reader :rows

  def initialize(row_groups)
    @rows = (1..9).zip(row_groups).reduce({}) do |hash, group|
      hash[group.first] = Row.new(group.last)
      hash
    end
    @columns = (1..9).reduce({}) do |hash, key|
      hash[key] = Column.new(rows.map do |_, row|
          row.spots[key])
        end
    end
  end


  # turn spots into a hash
  # initialize new rows with corresponding spots
  # init new columns w/ corresponding spots
  # init new squares w/ corresponding spots
end


class Row
  attr_reader :spots

  def initialize(row)
    @spots = (1..9).zip(row).reduce({}) do |hash, value|
      hash[value.first] = Spot.new(value.last)
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
