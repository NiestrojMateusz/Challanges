class Sieve
  def initialize(num)
    @range = (2..num).to_a
  end
  
  def primes
    @range.each do |prime|
      @range.reject! {|num| (num != prime) && (num % prime == 0) }
    end  
    
    @range
  end
  
  
end