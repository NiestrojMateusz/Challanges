class Series
  attr_reader :numbers

  def initialize(string)
    @numbers = string.each_char.map(&:to_i)
  end

  def slices(count)
    fail ArgumentError.new("Slice is longer than input.") if count > numbers.length
    numbers.each_cons(count).to_a
  end
end