def rotate_array(arr)
  rotated_arr = []
  arr[1..-1].each { |element| rotated_arr << element }
  rotated_arr << arr[0]
end

def rotate_rightmost_digits(int, n)
  array = int.to_s.chars
  (array[0...-n] + rotate_array(array[-n..-1])).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917