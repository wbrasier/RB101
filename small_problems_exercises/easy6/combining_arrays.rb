def merge(array_1, array_2)
  merged_array = array_1.concat(array_2).uniq
  # or simmply array_1 | array_2
end 

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
