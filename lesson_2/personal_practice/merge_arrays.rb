# START
# given two arrays of numbers with the same number of elements
# SET an index variable to 0
# SET an empty array
# iterate through the first array, assigning it to the index of the index variable
# index += 2 after each iteration
# Repeat the previous steps, but start the index variable at 1
# PRINT the result
# END
array_1 = [11, 14, 153, 14352, 1653 , 145523, 14, 167]
array_2 = [25624, 256, 25, 27689, 2876, 297, 256765, 2452]

def merge_arrays(arr_1, arr_2)
  merged_array = []
  index = 0
  
  arr_1.each do |num|
    merged_array[index] = num
    index += 2
  end
  
  index = 1
  arr_2.each do |num|
    merged_array[index] = num
    index += 2
  end
  p merged_array
end

    

merge_arrays(array_1, array_2)