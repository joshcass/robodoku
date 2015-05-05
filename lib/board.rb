require_relative 'spot'
require_relative 'row'
require_relative 'column'
require_relative 'square'


class Board
  attr_reader :rows, :columns, :squares, :spots

  def initialize(row_groups)
    @spots = row_groups.flat_map {|row_group| row_group.each_char.map {|value| Spot.new(value)}}
    @rows = spots.each_slice(9).map {|slice| Row.new(slice)}
    @columns = (0..8).flat_map {|index| Column.new(rows.map {|row| row.spots[index]})}
    @squares = [Square.new(rows[0..2].flat_map {|row| row.spots[0..2]}),
                Square.new(rows[0..2].flat_map {|row| row.spots[3..5]}),
                Square.new(rows[0..2].flat_map {|row| row.spots[6..8]}),
                Square.new(rows[3..5].flat_map {|row| row.spots[0..2]}),
                Square.new(rows[3..5].flat_map {|row| row.spots[3..5]}),
                Square.new(rows[3..5].flat_map {|row| row.spots[6..8]}),
                Square.new(rows[6..8].flat_map {|row| row.spots[0..2]}),
                Square.new(rows[6..8].flat_map {|row| row.spots[3..5]}),
                Square.new(rows[6..8].flat_map {|row| row.spots[6..8]})]
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
