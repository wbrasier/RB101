# START
# given an array of integers
# SET an empty array
# SET an iterator to 0
# WHILE iterator <= integer array.size
# add the value at the index of the iterator to the empty array
# iterator += 2
# PRINT the new array
# END

array = [1, 5, 34, 543, 2, 0, 5, 43, 46454, 453]

def every_other(arr)
  every_other_array = []
  i = 0
  loop do
    if i < arr.size
      every_other_array << arr[i]
      i += 2
    else
      break
    end
  end 
  p every_other_array
end

every_other(array)