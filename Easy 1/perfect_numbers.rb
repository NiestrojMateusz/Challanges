class PerfectNumber 
  def self.classify(number)
    raise RuntimeError if number < 0
    sum_of_factors = get_divisors(number).inject(:+)
    
    case 
      when sum_of_factors > number then "abundant"
      when sum_of_factors == number then "perfect"
      else "deficient"
    end
  end
  
  def self.get_divisors(number)
    (1..number-1).select {|div| number % div == 0}
  end
end
