def bubble_sort!(arr)
  loop do
    swaps = 0
    arr.each_with_index do |element, index|
      position = element <=> arr[index + 1]
      # moves position and adds 1 to swap counter
      if position == 1
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swaps += 1
      end
    end
    break if swaps == 0
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)