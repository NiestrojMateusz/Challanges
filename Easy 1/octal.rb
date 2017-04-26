class Octal
  attr_reader :octal, :length
  def initialize(octal_string)
    @octal = octal_string
    @decimal = 0
  end
  
  def to_decimal
    octal.chars.map(&:to_i).reverse.each_with_index do |num, index|
      @decimal += num*(8**index)
    end
    @decimal
  end
  
end

