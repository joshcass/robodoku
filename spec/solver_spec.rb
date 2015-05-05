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
    |  26594317
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

  xit 'solves a slightly harder puzzle' do
    puzzle_text2 = ["165794 38\n", "4 7  2 5 \n", "93   6  4\n", "81 4 5  2\n", "5762394  \n", "2  6 1 75\n", "3 15 7849\n", "69    527\n", " 5  281 3\n"]
    @solver2 = Solver.new(puzzle_text2)
    # puts @solver2.solve
  end
end
