class Anagram
  
  def initialize(word)
    @word = word
    @result = []
  end
  
  def match(list_of_words)
    list_of_words.each do |word|
      next if @word.downcase == word.downcase 
      @result << word if split_string(@word) == split_string(word)
    end
    @result
  end
  
  def split_string(string)
    string.downcase.chars.sort
  end
  
end