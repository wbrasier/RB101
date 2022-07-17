array = []
i = 1

loop do 
  case i
  when 1
    puts "=> Enter the 1st number:"
  when 2
    puts "=> Enter the 2nd number:"
  when 3
    puts "=> Enter the 3rd number:"
  when 4
    puts "=> Enter the 4th number:"
  when 5 
    puts "=> Enter the 5th number:"
  when 6
    puts "=> Enter the last number:"
  end
  
  num = gets.chomp.to_i
  array << num
  i += 1
  break if i > 6
end 

final_num = array.pop

if array.include?(final_num)
  puts "The number #{final_num} appears in #{array.inspect}."
else
  puts "The number #{final_num} does not appear in #{array.inspect}."
end 
