# reverses the letters in words with 5+ characters

def reverse_words(string)
  array = string.split

  array.map! do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
