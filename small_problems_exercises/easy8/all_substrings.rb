def leading_substrings(string)
  substrings = []
  counter = 0
  
  loop do
    substrings << string[0..counter]
    counter += 1
    break if counter >= string.size
  end
  
  substrings
end

def substrings(string)
  all_substrings = []
  counter = 0
  loop do
    all_substrings << leading_substrings(string[counter..-1])
    counter += 1
    break if counter >= string.size
  end
  all_substrings.flatten
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]