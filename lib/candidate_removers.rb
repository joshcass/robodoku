require 'set'

module CandidateRemovers

  def remove_candidates
    remove_locked_values
    remove_hidden_singles
    remove_locked_values
    remove_naked_pairs
    remove_locked_values
    remove_hidden_pairs
  end

  def remove_locked_values
    spots.each do |spot|
      if spot.locked?
        unlocked_spots.each { |s| s.remove_candidate(spot.value) }
      end
    end
  end

  def remove_hidden_singles
    unlocked_spots.each do |spot|
      spts = unlocked_spots
      spts.delete(spot).candidates.each do |cdt|
        unless spts.reduce([]) { |ary, spt| ary + spt.candidates }.to_set.merge(spots.map { |spt| spt.value }).include?(cdt)
          spot.value = cdt
        end
      end
    end
  end

  def remove_naked_pairs
    unlocked_spots.each do |spot|
      if spot.candidates.length == 2
        spts = unlocked_spots
        crnt = spts.delete(spot)
        spts.each do |spt|
          if spt.candidates == crnt.candidates
            spts.delete(spt)
            spts.each do |spt|
              spt.remove_candidate(crnt.candidates.first)
              spt.remove_candidate(crnt.candidates.last)
            end
          end
        end
      end
    end
  end

  def remove_hidden_pairs
    unlocked_spots.each do |spot|
      @spt1 = 0
      @spt2 = nil
      @crnt_cdt1 = nil
      @crnt_cdt2 = nil
      spts = unlocked_spots
      crnt = spts.delete(spot)
      crnt.candidates.each do |cdt|
        spt1 = spts.select { |sp| sp.candidates.include?(cdt) }
        if spt1.length == 1
          @spt1 = spt1.first
          @crnt_cdt1 = cdt
          crnt.candidates.each do |cnd|
            if cnd != @crnt_cdt1
              spt2 = spts.select { |sp| sp.candidates.include?(cnd) }
              if spt2.length == 1
                @spt2 = spt2.first
                @crnt_cdt2 = cnd
                if @spt1 == @spt2
                  crnt.candidates.each do |c|
                    if c != @crnt_cdt1 && c != @crnt_cdt2
                      crnt.remove_candidate(c)
                    end
                  end
                  @spt1.candidates.each do |c|
                    if c != @crnt_cdt1 && c != @crnt_cdt2
                      @spt1.remove_candidate(c)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  def unlocked_spots
    spots.reject { |spot| spot.locked? }
  end

end
