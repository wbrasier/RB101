def rotate_array(arr)
  rotated_arr = []
  arr[1..-1].each { |element| rotated_arr << element }
  rotated_arr << arr[0]
end

def rotate_rightmost_digits(int, n)
  array = int.to_s.chars
  (array[0...-n] + rotate_array(array[-n..-1])).join.to_i
end

def max_rotation(int)
  counter = int.to_s.chars.size
  num = int.to_f
  loop do
    num = rotate_rightmost_digits(num, counter)
    counter -= 1
    break if counter == 0
    p num
  end
  num
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(10034)
