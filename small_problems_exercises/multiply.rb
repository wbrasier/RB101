def multiply(num_1, num_2)
  num_1 * num_2
end

puts "=> What is the first integer?"
int_1 = gets.chomp.to_i

puts "=> What is the second integer?"
int_2 = gets.chomp.to_i

puts multiply(int_1, int_2)
