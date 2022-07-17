def multisum(int)
  divisibles = []
  loop do
    if int % 3 == 0 || int % 5 == 0
      divisibles << int
    end
    int -= 1
    break if int == 1
  end
  divisibles.sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168