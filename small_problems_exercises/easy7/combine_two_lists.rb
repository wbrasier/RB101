def interleave(array_1, array_2)
  combined_array = []
  counter = 0
  until counter >= array_1.length
    combined_array << array_1[counter] << array_2[counter]
    counter += 1
  end
  combined_array
end

# further exploration solution
def alternative_interleave(array_1, array_2)
  combined_array = array_1.zip(array_2).flatten
end

=begin alternative solution 
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end
=end

puts alternative_interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
