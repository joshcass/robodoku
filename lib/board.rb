require_relative 'spot'
require_relative 'row'
require_relative 'column'
require_relative 'square'


class Board
  attr_reader :rows, :columns, :squares, :spots

  def initialize(board_chars)
    @spots   = board_chars.map { |value| Spot.new value }
    @rows    = spots.each_slice(9).map { |slice| Row.new slice }
    @columns = @rows.transpose.map { |spots| Column.new spots }
    @squares = spots.each_slice(9)
                    .each_slice(3)
                    .flat_map {|row| row.transpose.flatten}
                    .each_slice(9).map {|sqr_spots| Square.new(sqr_spots)}
  end

  def remove_all_candidates
    rows.each {|row| row.remove_candidates}
    columns.each {|column| column.remove_candidates}
    squares.each {|square| square.remove_candidates}
  end

  def all_locked?
    spots.all? {|spot| spot.locked?}
  end
end
