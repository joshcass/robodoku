module CandidateRemovers

  def remove_candidates
    remove_locked_values
    remove_hidden_singles
  end

  def remove_locked_values
    spots.each do |spot|
      if spot.locked?
        unlocked_spots.each {|s| s.remove_candidate(spot.value)}
      end
    end
  end

  def remove_hidden_singles
    unlocked_spots.each do |spot|
      spts = unlocked_spots
      spts.delete(spot).candidates.each do |cdt|
        unless spts.reduce([]) {|ary, spt| ary + spt.candidates}.to_set.merge(spots.map {|spt| spt.value}).include?(cdt)
          spot.value = cdt
        end
      end
    end
  end

  def unlocked_spots
    spots.reject {|spot| spot.locked?}
  end
end
