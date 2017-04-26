
class Trinary
  INVALID_TRINARY = /\D|[3-9]/
  attr_reader :trinary, :length
  def initialize(trinary_string)
    @trinary = trinary_string
    @decimal = 0
  end
  
  def to_decimal
    return 0  if  @trinary =~ INVALID_TRINARY
    trinary.chars.map(&:to_i).reverse.each_with_index do |num, index|
      @decimal += num*(3**index)
    end
    @decimal
  end
  
end
