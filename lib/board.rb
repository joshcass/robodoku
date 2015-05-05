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

  def all_check
    rows.each {|row| row.row_check}
    columns.each {|column| column.column_check}
    squares.each {|square| square.square_check}
  end

  def all_locked?
    spots.all? {|spot| spot.locked?}
  end
end
