class Solver

  NUMBERS = [*1..9]

  def solve(puzzle_text)
    rows = puzzle_text.map {|row| [row.chomp.rjust(9, " ")]}
  end

  # map over the array of row strings
  # assign each a key from 1 - 81 and pass the value to a new instance of Spot

  # Spot
  # Square holds the spots 1-3 and 10-13
  # Board holds everything - analagous to sales_engine




end


class Spot
  def initialize(value)
    @value = value
    # if value is a space value = nil
  end

  # if value is a number remove that number from possibilites
  # otherwise don't do anything

  def possiblities
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def value_set?
    true if value
  end
end


# start looking at each square row and column and eliminate possiblites for the spots
#
