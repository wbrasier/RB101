# deal with more or fewer components as false
# return a false statement

def is_an_ip_number?
  array = [true, false]
  array.sample
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  dot_separated_words.size == 4 && is_an_ip_number?
end

puts dot_separated_ip_address?('10.4.5.11')
