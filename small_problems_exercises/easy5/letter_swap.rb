def swap(string)
  final_array = []
  words = string.split(' ')
  words.map do |word|
    word[0], word[-1] = word[-1], word[0]
    final_array << word
  end
  final_array.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
