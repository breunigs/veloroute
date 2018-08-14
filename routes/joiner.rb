module Joiner
  def self.join(arr_of_coords, reversable:)
    # need to join multiple times in case a segment can be concatted on both ends
    loop do
      prevsize = arr_of_coords.size
      arr_of_coords = join_once(arr_of_coords, reversable: reversable)
      break if prevsize == arr_of_coords.size
    end
    arr_of_coords
  end

  def self.join_once(arr_of_coords, reversable:)
    concatted = []
    arr_of_coords.each.with_index do |coords, y|
      success = false
      concatted.each.with_index do |segment, idx|
        # puts "#{y} detected in coords" if coords.include?([9.8690187, 53.5711965])
        # puts "#{y} detected in segment" if segment.include?([9.8690187, 53.5711965])
        coordsrev = coords.reverse

        if gluable?(segment, coords)
          concatted[idx] = glue(segment, coords)
        elsif gluable?(coords, segment)
          concatted[idx] = glue(coords, segment)
        elsif reversable && gluable?(segment, coordsrev)
          concatted[idx] = glue(segment, coordsrev)
        elsif reversable && gluable?(coordsrev, segment)
          concatted[idx] = glue(coordsrev, segment)
        else
          next
        end

        success = true
        break
      end

      concatted << coords unless success
    end

    concatted.freeze
  end

  def self.glue(arr1, arr2)
    (arr1 + arr2[1..-1]).freeze
  end

  def self.gluable?(arr1, arr2)
    arr1.last == arr2.first
  end
end
