class Solver

  def initialize(puzzle_text)
    rows = puzzle_text.map {|row| row.chomp.rjust(9, " ")}
    @board = Board.new(rows)
  end

  def solve

  end

end

class Board

  def initialize(rows)

    @rows =

      end
  end

  # turn spots into a hash
  # initialize new rows with corresponding spots
  # init new columns w/ corresponding spots
  # init new squares w/ corresponding spots
end


class Row
  def initialize(row)
    @spots = row.
  end
end


class Spot
  def initialize(value)
    @value = value
  end

  # if value is a number remove that number from possibilites
  # otherwise don't do anything

  def possiblities
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def locked?
    false if value == " "
  end
end


# start looking at each square row and column and eliminate possiblites for the spots
#
