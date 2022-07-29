def sequence(count, start_num)
  array = []
  counter = 1
  loop do
    break if array.size >= count
    array << start_num * counter
    counter += 1
  end
  p array
end

# alt solution
def sequence_alt(count, first)
  (1..count).map { |value| value * first }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
