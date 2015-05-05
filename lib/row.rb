class Row
  attr_reader :spots
  alias to_ary spots

  def initialize(spots)
    @spots = spots
  end

  def row_check
    unlocked_spots = spots.reject {|spot| spot.locked?}
    spots.each do |spot|
      if spot.locked?
        unlocked_spots.each {|s| s.remove_candidate(spot.value)}
      end
    end
  end
end
