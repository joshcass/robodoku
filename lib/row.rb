class Row
  attr_reader :spots
  alias to_ary spots

  def initialize(spots)
    @spots = spots
  end

  def remove_candidates
    simple_remover
    # hidden_singles_remover
  end

  def simple_remover
    spots.each do |spot|
      if spot.locked?
        unlocked_spots.each {|s| s.remove_candidate(spot.value)}
      end
    end
  end

  def hidden_singles_remover

  end

  def unlocked_spot
    spots.reject {|spot| spot.locked?}
  end
end
