class School
  attr_accessor :school
  def initialize
    @school = Hash.new([])
  end
  
  def to_h
    school.each {|k, v| school[k] = v.sort }.sort.to_h
  end
  
  def add(name, grade)
    if school.has_key?(grade)
      school[grade] << name
    else
      school[grade] = [name]
    end
  end
  
  def grade(num)
    [] if !school.has_key?(num)
    school[num]
  end
  
end
