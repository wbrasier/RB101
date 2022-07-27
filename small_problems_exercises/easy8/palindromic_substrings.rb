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


def palindromes(string)
  substrings(string) .select do |sub|
    sub.size > 1 && (sub == sub.reverse)
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]