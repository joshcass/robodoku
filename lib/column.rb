class Column
  attr_reader :spots

  def initialize(spots)
    @spots = spots
  end

  def column_check
    unlocked_spots = spots.reject {|spot| spot.locked?}
    spots.each do |spot|
      if spot.locked?
        unlocked_spots.each {|s| s.remove_candidate(spot.value)}
      end
    end
  end
end
