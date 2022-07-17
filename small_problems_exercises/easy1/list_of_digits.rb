def digit_list(int)
  array = int.to_s.split('')
  array.map(&:to_i)
  # is the same thing as array.map { |num| num.to_i }
end

print "=> Positive integer: "
num = gets.chomp.to_i

p  digit_list(num)