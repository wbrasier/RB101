def fibonacci(int)
  arr = build_arr(int)
  arr[int - 1]
end

def build_arr(int)
  fib_arr = [1, 1]
  index = 1
  loop do
    n = fib_arr[index - 1] + fib_arr[index]
    fib_arr << n
    index += 1
    break if index >= int
  end
  fib_arr
end

# alternative solution that they did
def fibonacci_alt(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765