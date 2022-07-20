
def find_fibonacci_index_by_length(length)
  fibonacci_array = []
  counter = 0
  loop do
    fibonacci_array << find_fibonacci_number(counter)
    break if fibonacci_array[counter].to_s.length >= length
    counter += 1
  end
  counter + 1
end

def find_fibonacci_number(num)
  if num < 2
    fib_num = 1
  else 
    fib_num = find_fibonacci_number(num - 2) + find_fibonacci_number(num - 1)
  end
  fib_num
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12   # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847

