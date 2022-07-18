def ascii_value(string)
  sum = 0
  string.each_char do |string_char|
    sum += string_char.ord
  end
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

#to revert from ascii to string use Integer#chr