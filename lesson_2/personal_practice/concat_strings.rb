# START
# given an array of strings
# SET an empty string variable
# iterate through the array
# add each array item to the empty string variable
# PRINT the string 
# END

arr = %w(one two three four five)

def concat(arr) 
  string = ' '
  arr.each {|word| string << "#{word} " }
  puts string
end 

concat(arr)
