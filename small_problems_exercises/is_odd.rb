#added the further exploration so that it doesn't matter if it is modulo or remainder

def is_odd?(int)
  if  int == '0' || int == '2' || int == '4' ||
      int == '6' || int == '8'
    false
  else
    true
  end
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

num_array = num.to_s.split('')
integer = num_array.pop
prompt(is_odd?(integer))

if is_odd?(integer)
  prompt("#{num} is odd!")
else
  prompt("#{num} is even!")
end
