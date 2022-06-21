def is_odd?(int)
 int % 2 == 1
end

def prompt(string)
  puts "=> #{string}"
end

def valid_int?(int)
  (int.to_f == int.to_i) && (int.to_i.to_s == int)
end

num = ''
loop do
  prompt('What number would you like to check if it is odd?')
  num = gets.chomp
  break if valid_int?(num)

  prompt('You must input an integer!')
end

prompt(is_odd?(num.to_i))

if is_odd?(num.to_i)
  prompt("#{num} is odd!")
else
  prompt("#{num} is even!")
end
