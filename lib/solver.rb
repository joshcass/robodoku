require_relative 'board'

class Solver
  attr_reader :board

  def initialize(puzzle_text)
    row_groups = puzzle_text.map {|row| row.chomp.rjust(9, " ")}
    @board = Board.new(row_groups)
  end

  def solve
    until board.all_locked?
      board.all_check
    end
    board.spots.each_slice(9).map {|s| s.map {|s| s.value}.join}
  end
end




