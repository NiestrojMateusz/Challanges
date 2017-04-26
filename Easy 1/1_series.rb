class Series
  def initialize(string)
    @string = string
    @length = string.length
    @series = []
  end
  
  def slices(series_length)
    fail ArgumentError.new("Slice is longer than input.") if series_length > @length
    iteration = 0
    loop do
      break if iteration > @length - series_length
      @series << @string.chars.map(&:to_i).slice(iteration, series_length)
      iteration += 1
    end
    @series
  end
end
