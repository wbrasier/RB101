def crunch(string)
  final_string = ''
  array = string.split.map do |word|
    word.chars
  end
  array.each do |word|
    counter = 0
    loop do
      if word[counter - 1] != word[counter] || counter == 0
        final_string << word[counter] 
      end
      counter += 1
      break if counter == word.size
    end
    final_string << ' '
  end
  final_string.rstrip
end

#alternative solution:
def crunch(string)
  final_string = ''
  counter = 0
  while counter != string.size
    final_string << string[counter] unless string[counter + 1] == string[counter] 
    counter += 1
  end
  final_string
end

#alternative solution:
def crunch(string)
  string.gsub(/(.)\1+/, '\1')
end


puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
