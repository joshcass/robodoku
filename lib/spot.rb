class Spot
  attr_reader :candidates
  attr_accessor :value

  def initialize(value)
    @value = value
    value == "-" ? @candidates = ["1", "2", "3", "4", "5", "6", "7", "8", "9"] : @candidates = [value]
  end

  def remove_candidate(num)
    @candidates.delete(num)
    if candidates.length == 1
      @value = candidates.first
    end
  end

  def locked?
    value != "-"
  end
end
