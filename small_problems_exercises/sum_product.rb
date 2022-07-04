def sum(int_array)
  int_array.sum
end

def product(int_array)
  product = int_array.inject(:*)
end

loop do #main loop
  print ">> Please enter an integer greater than 0: "
  num = gets.chomp.to_i
  array = Array.new(num) { |i| i + 1 }
  
  print ">> Enter 's' to compute the sum, 'p' to compute the product: "
  s_or_p = gets.chomp.downcase
  
  if s_or_p == 's'
    puts "The sum of the integers between 1 and #{num} is #{sum(array)}."
  elsif s_or_p == 'p'
    puts "The product of the integers between 1 and #{num} is #{product(array)}."
  else
    puts "Whoops! Unknown operation. You must enter 's' or 'p'.  "
    s_or_p = gets.chomp.downcase
  end
  
  puts "Would you like to do another operation?"
  again = gets.chomp.downcase
  
  break if again.include?('n')
end
