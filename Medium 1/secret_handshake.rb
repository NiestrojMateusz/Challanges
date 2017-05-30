class SecretHandshake
  attr_accessor :result
  
  COMMANDS = ["wink", "double blink", "close your eyes", "jump"]
  
  def initialize(input)
    @result = []
    @binary_chars = parse_input(input)
  end
  
  def parse_input(input)
    if input.is_a?(Fixnum)
      input.to_s(2).split("").reverse
    elsif input.is_a?(String) && input.match(/[A-Za-z]/) != nil
      result
    else
      input.split("").reverse
    end  
  end
  
  def validate(chars)
    chars.each_with_index do |char, idx|
        result << COMMANDS[idx] if char == "1" 
    end
    result
  end
  
  def commands
    if @binary_chars == []
      @binary_chars 
    elsif @binary_chars.length > 4 && @binary_chars[-1] == "1"
      @binary_chars.pop
      validate(@binary_chars).reverse
    else
      validate(@binary_chars)
    end
  end
end
