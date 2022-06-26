# averages all the integers in an array

def average(array)
  sum = array.sum
  sum.to_f / array.size.to_f
end

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
