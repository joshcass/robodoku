require "minitest"
require "minitest/autorun"
require "./lib/solver"

class SolverTest < Minitest::Test
  def setup
    puzzle_text = [" 26594317\n", "71563894 \n", "394721865\n", "163459278\n", "948267153\n", "25781369 \n", "531942786\n", "482176539\n", "679385421\n"]
    @solver = Solver.new(puzzle_text)
  end

  def test_init
    require 'pry'
    binding.pry
  end
end
