require "solver"

RSpec.describe Solver do
  def to_board_chars(string)
    string.gsub(/^.*(.{9})$/, "\\1").gsub("\n", "").chars
  end

  def solve(puzzle_string)
    Solver.solve(to_board_chars puzzle_string)
  end

  def assert_solves(puzzle, solution)
    actual   = solve(puzzle)
    expected = to_board_chars solution
    expect(actual).to eq expected
  end

  it 'removes locked values' do
    spots = ["1", "2", "3", "4", "5", "6", "7", "8", "-"].map { |val| Spot.new(val) }
    row = Row.new(spots)
    row.remove_locked_values
    expect(row.spots.map {|spot| spot.value}).to eq ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  it 'removes naked pairs' do
    spots = ["-", "6", "-", "4", "2", "-", "-", "8", "9"].map { |val| Spot.new(val) }
    column = Column.new(spots)
    spots[0].candidates = ["7", "5", "3"]
    spots[2].candidates = ["1", "3"]
    spots[5].candidates = ["1", "5"]
    spots[6].candidates = ["1", "5", "3"]
    column.remove_hidden_singles
    expect(spots[0].value).to eq "7"
  end

  it 'removes naked pairs' do
    spots = ["7", "-", "-", "-", "9", "-", "-", "-", "3"].map { |val| Spot.new(val) }
    row = Row.new(spots)
    spots[1].candidates = ["1", "2", "4", "5"]
    spots[2].candidates = ["1", "4", "5"]
    spots[3].candidates = ["2", "4", "5"]
    spots[5].candidates = ["8", "6"]
    spots[6].candidates = ["8", "6"]
    spots[7].candidates = ["1", "6", "8"]
    row.remove_naked_pairs
    expect(spots[7].candidates.first).to eq "1"
  end

  it 'removes hidden pairs' do
    spots = ["7", "-", "-", "-", "8", "4", "-", "6", "-"].map { |val| Spot.new(val) }
    square = Square.new(spots)
    spots[1].candidates = ["2", "3"]
    spots[2].candidates = ["2", "3", "5"]
    spots[3].candidates = ["1", "2", "5", "9"]
    spots[6].candidates = ["1", "5", "9"]
    spots[8].candidates = ["5", "3"]
    square.remove_hidden_pairs
    expect(spots[3].candidates).to eq ["1", "9"]
  end

  it 'solves an easy puzzle' do
    puzzle = <<-PUZZLE
    | ---26-7-1
    | 68--7--9-
    | 19---45--
    | 82-1---4-
    | --46-29--
    | -5---3-28
    | --93---74
    | -4--5--36
    | 7-3-18---
    PUZZLE
    solution = <<-SOLUTION
    | 435269781
    | 682571493
    | 197834562
    | 826195347
    | 374682915
    | 951743628
    | 519326874
    | 248957136
    | 763418259
    SOLUTION
    assert_solves puzzle, solution
  end

  it 'solves an intermediate puzzle' do
    puzzle = <<-PUZZLE
    | 8--5-3--9
    | ---6-97--
    | --4-7---5
    | 48------6
    | --2---4--
    | 9------38
    | 6---8-1--
    | --13-6---
    | 7--1-5--2
    PUZZLE
    solution = <<-SOLUTION
    | 876543219
    | 253619784
    | 194872365
    | 485731926
    | 362958471
    | 917264538
    | 629487153
    | 541326897
    | 738195642
    SOLUTION
    assert_solves puzzle, solution
  end

  it 'solves a difficult puzzle' do
    puzzle = <<-PUZZLE
    | 1---7--3-
    | 83-6-----
    | --29--6-8
    | 6----49-7
    | -9-----5-
    | 3-75----4
    | 2-3--91--
    | -----2-43
    | -4--8---9
    PUZZLE
    solution = <<-SOLUTION
    | 169875432
    | 834621795
    | 572943618
    | 625134987
    | 498267351
    | 317598264
    | 283459176
    | 956712843
    | 741386529
    SOLUTION
    assert_solves puzzle, solution
  end
end
