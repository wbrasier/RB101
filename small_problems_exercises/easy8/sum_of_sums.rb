def sum_of_sums(array)
  sums = []
  
  loop do
    sums << array.sum
    array.pop
    break if array.empty?
  end
  
  sums.sum
end

# alternative using the inject method that doesn't mutate array
def sum_of_sums_alt(array)
  sums = []
  counter = -1
  
  loop do
    sums << array[0..counter].inject('+')
    counter -= 1
    break if counter < -(array.size)
  end
  
  sums.inject('+')
end

# their solution that is nice
def sum_of_sums_alt_2(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

p sum_of_sums_alt([3, 5, 2]) == 21
p sum_of_sums_alt([1, 5, 7, 3]) == 36
p sum_of_sums_alt([4]) == 4
p sum_of_sums_alt([1, 2, 3, 4, 5]) == 35