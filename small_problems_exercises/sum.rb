# sum of all the digits in an int

def sum(int)
  array = int.digits
  array.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
