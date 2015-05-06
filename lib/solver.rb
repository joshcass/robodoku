require_relative 'spot'
require_relative 'candidate_removers'

class Solver
  def self.solve(board_chars)
    board = Board.new board_chars
    board.remove_all_candidates until board.all_locked?
    board.spots.map &:value
  end
end

class Board
  attr_reader :rows, :columns, :squares, :spots

  def initialize(board_chars)
    @spots   = board_chars.map { |value| Spot.new value }
    @rows    = spots.each_slice(9).map { |slice| Row.new slice }
    @columns = @rows.transpose.map { |spots| Column.new spots }
    @squares = spots.each_slice(9)
                    .each_slice(3)
                    .flat_map {|row| row.transpose.flatten}
                    .each_slice(9)
                    .map {|sqr_spots| Square.new(sqr_spots)}
    require 'pry'
    binding.pry
  end

  def remove_all_candidates
    rows.each {|row| row.remove_candidates}
    columns.each {|column| column.remove_candidates}
    squares.each {|square| square.remove_candidates}
  end

  def remove_sqr_locked_candidates

  end


  def all_locked?
    spots.all? {|spot| spot.locked?}
  end
end

class Square
  include CandidateRemovers
  attr_reader :spots

  def initialize(spots)
    @spots = spots
  end
end

class Column
  include CandidateRemovers
  attr_reader :spots

  def initialize(spots)
    @spots = spots
  end
end

class Row
  include CandidateRemovers
  attr_reader :spots
  alias to_ary spots

  def initialize(spots)
    @spots = spots
  end
end
