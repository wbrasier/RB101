# START
# given a string
# given a character
# convert the string to an array 
# SET an interator, occurences, to 0
# SET another iterator, count, to 0
# WHILE the count is less than or equal to the size of the array
# iterate through the array and add one if the object matches the character
# IF the occurences are less than 0, return nil
# ELSIF the occurences are greater than 3, return the iterator
# END

string = "quintin and hannah montana in a tree"
character = 'n'
=begin
def occurence(str, letter)
  array = str.downcase.split('')
  occurences = 0
  count = 0
  loop do
    if count <= array.size
      occurences += 1 if array[count] == letter.downcase
      count += 1
    else
      break
    end
  end
  if occurences >= 3
    puts occurences
  else
    puts 'nope'
  end
end
=end
def occurence(str, letter)
  array= str.downcase.split('')
  occurences = 0
  array.each do |char|
    occurences +=1 if char == letter.downcase
  end
  if occurences >= 3 
    puts occurences
  else
    puts 'nope'
  end
end

occurence(string, character)