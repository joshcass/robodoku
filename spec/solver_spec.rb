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

  it 'solves a simple puzzle' do
    puzzle = <<-PUZZLE
    | -26594317
    | 715638942
    | 394721865
    | 163459278
    | 948267153
    | 257813694
    | 531942786
    | 482176539
    | 679385421
    PUZZLE
    solution = <<-SOLUTION
    | 826594317
    | 715638942
    | 394721865
    | 163459278
    | 948267153
    | 257813694
    | 531942786
    | 482176539
    | 679385421
    SOLUTION
    assert_solves puzzle, solution
  end

  it 'solves a slightly harder puzzle' do
    puzzle = <<-PUZZLE
    | 4--3-6--8
    | -2-89--7-
    | --85--4--
    | 764258-13
    | -5-1---2-
    | 9--7-3--4
    | --69--142
    | -3--8-659
    | 1--6-5--7
    PUZZLE
    solution = <<-SOLUTION
    | 475316298
    | 621894375
    | 398572461
    | 764258913
    | 853149726
    | 912763584
    | 586937142
    | 237481659
    | 149625837
    SOLUTION
    assert_solves puzzle, solution
  end
end
