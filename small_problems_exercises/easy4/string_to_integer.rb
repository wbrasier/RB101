DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
  'F' => 15
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def hexidecimal_to_integer(string)
  digits = string.upcase.chars.map { |digit| DIGITS[digit] }
  sum = 0
  digits.each { |digit| sum = 16 * sum + digit }
  sum
end

def string_to_signed_integer(string)
  if string.include?('-')
    string = string.delete_prefix('-')
    integer = string_to_integer(string)
    integer *= -1
  elsif string.include?('+')
    string = string.delete_prefix('+')
    integer = string_to_integer(string)
  else
    integer = string_to_integer(string)
  end
  integer
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100