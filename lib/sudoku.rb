require './lib/solver'

puzzle_path = ARGV[0]
chars       = File.read(puzzle_path).gsub("\n", "").chars
solved      = Solver.solve(chars)
solved.each_slice(9) { |slice| puts slice.join }
