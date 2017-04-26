
class DNA
  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(distance)
    index = 0
    @distance = 0
    breaker = strand_length(strand, distance)
    loop do 
      break if index == breaker
      if strand_to_array(strand)[index] == strand_to_array(distance)[index]
        @distance
      else
        @distance += 1
      end
      index += 1
    end
    @distance
  end
  
  private
  
  def strand_to_array(string)
    string.chars
  end
  
  def strand_length(strand, distance)
    length = strand.length <=> distance.length
    case length
    when -1 then strand.length
    else  distance.length
    end
  end
end
# ===============================better solution======================
# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(strand_2)
#     strand_1 = @strand[0, strand_2.length]

#     strand_1.chars.zip(strand_2.chars).count { |pair| pair.first != pair.last }
#   end
# end