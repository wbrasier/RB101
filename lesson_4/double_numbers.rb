def double_numbers!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size
    numbers[counter] *= 2 if numbers[counter].odd?
    counter += 1
  end
  numbers
end





my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]