def leading_substrings(string)
  substrings = []
  counter = 0
  
  loop do
    substrings << string[0..counter]
    counter += 1
    break if counter >= string.size
  end
  
  p substrings
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
