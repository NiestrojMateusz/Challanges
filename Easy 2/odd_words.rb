def odd_words(string)
  
  if words?(string)
    string.gsub!(/\.\s+.*/, ".")
    reverese_odd(string)
  else
    ""
  end  
end

def reverese_odd(string)
  result = []
  string.lstrip.gsub(/[,.!?]/, "").split(" ").each_with_index do |word, index|
      if index % 2 != 0
        result << word.reverse
      else 
        result << word
      end
  end
  result.join(" ") + "."
end

def words?(string)
  string.match(/\w+/)
end

p odd_words("What the matter with kansas.")

p odd_words("This is sentence with two  spaces and commas, and !. That it")

p odd_words(" ")

p odd_words(" .")

p odd_words("")

p odd_words("Hello Word.")

p odd_words("What the matter. with kansas.")