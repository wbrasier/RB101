def multiply(num_1, num_2)
  num_1 * num_2
end

def square(num)
  multiply(num, num)
end

puts "=> What is the integer?"
int = gets.chomp.to_i

puts square(int)
