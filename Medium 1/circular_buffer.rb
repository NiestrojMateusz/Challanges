require 'pry'
class CircularBuffer
  attr_reader :size
  attr_accessor :buffer
  
  @@index = 0
  @@output = nil
  def initialize(size)
    @size = size
    @buffer = []
  end
  
  def change_index
    if @@index == @buffer.size - 1
       @@index = 0
    else 
      @@index += 1
    end
  end
  
  def read
    raise BufferEmptyException if @buffer == []
    @buffer.shift
  end
  
  def write(input)
    return if input == nil
    raise BufferFullException if @buffer.size == size
    @buffer.push(input)
  end
  
  def write!(input)
    return if input == nil
    if @buffer.size == size
      @buffer.shift
      @buffer.push(input)
    else
      write(input)
    end
  end
  
  def clear
    @buffer = []
  end
  
  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end
    
end

# buffer = CircularBuffer.new(1)
#     buffer.write '1'
#     buffer.read