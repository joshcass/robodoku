require_relative 'board'

class Solver
  def self.solve(board_chars)
    board = Board.new board_chars
    board.all_check until board.all_locked?
    board.spots.map &:value
  end
end
