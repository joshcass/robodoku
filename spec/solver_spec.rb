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
    | -2-6-8---
    | 58---97--
    | ----4----
    | 37----5--
    | 6-------4
    | --8----13
    | ----2----
    | --98---36
    | ---3-6-9-
    PUZZLE
    solution = <<-SOLUTION
    | 123678945
    | 584239761
    | 967145328
    | 372461589
    | 691583274
    | 458792613
    | 836924157
    | 219857436
    | 745316892
    SOLUTION
    assert_solves puzzle, solution
  end

  xit 'solves a difficult puzzle' do
    puzzle = <<-PUZZLE
    | 2--3-----
    | 8-4-62--3
    | -138--2--
    | ----2-39-
    | 5-7---621
    | -32--6---
    | -2---914-
    | 6-125-8-9
    | -----1--2
    PUZZLE
    solution = <<-SOLUTION
    | 276314958
    | 854962713
    | 913875264
    | 468127395
    | 597438621
    | 132596487
    | 325789146
    | 641253879
    | 789641532
    SOLUTION
    assert_solves puzzle, solution
  end
end
