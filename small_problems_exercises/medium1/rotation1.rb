def rotate_array(arr)
  rotated_arr = []
  arr[1..-1].each { |element| rotated_arr << element }
  rotated_arr << arr[0]
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

def rotate_string_or_int(item)
  characters = item.to_s
  characters[1..-1] + characters[0]
end

p rotate_string_or_int(1256)
p rotate_string_or_int("happy")

