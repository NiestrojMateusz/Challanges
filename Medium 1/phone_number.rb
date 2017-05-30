class PhoneNumber
  attr_reader :input
  
  def initialize(input)
    @input = input
  end
  
  def valid(input)
    digits = input.gsub(/[^0-9]/, "")
    digits_count = input.count("0123456789")
    if input.match(/[A-Za-z]/) || digits_count > 11 || digits_count < 10
      "0000000000"
    elsif digits_count == 11
      array_of_digits = digits.chars
      if array_of_digits.first == "1" 
        array_of_digits.shift
        array_of_digits.join("")
      else
        "0000000000"
      end
    else
      digits
    end
  end
  
  def number
    valid(input)
  end
  
  def area_code
    self.number[0..2]
  end
  
  def to_s
    number = self.number
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end

