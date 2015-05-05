require "minitest"
require "minitest/autorun"
require "./lib/solver"

class SolverTest < Minitest::Test
  def setup
    puzzle_text = [" 26594317\n", "715638942\n", "394721865\n", "163459278\n", "948267153\n", "257813694\n", "531942786\n", "482176539\n", "679385421\n"]
    puzzle_text2 = ["165794 38\n", "4 7  2 5 \n", "93   6  4\n", "81 4 5  2\n", "5762394  \n", "2  6 1 75\n", "3 15 7849\n", "69    527\n", " 5  281 3\n"]
    @solver = Solver.new(puzzle_text)
    @solver2 = Solver.new(puzzle_text2)
  end

  def test_solving_simple_puzzle
    puts @solver.solve
  end

  def test_solving_slightly_harder_puzzle
    puts @solver2.solve
  end
end
