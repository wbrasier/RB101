def integer_to_string(int)
  array = []
  counter = 1
  initial_num = int
  loop do 
    digit = int % 10
    array << digit
    int = ((int - digit)/10)
    counter *= 10
    break if counter > initial_num
  end
  array.reverse.join('')
end

def signed_integer_to_string(int)
  if int > 0
    string = '+' + integer_to_string(int)
  elsif int == 0
    string = '0'
  else
    string = '-' + integer_to_string(int * -1)
  end 
  string
end

=begin
alternate solution
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end
=end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
