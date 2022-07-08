def oddities(array)
  odd_array = []
  counter = 0
  loop do
    break if counter >= array.length
    element = array[counter]
    odd_array << element
    counter += 2
  end
  odd_array
end

def evens(array)
  even_array = []
  counter = 0
  array.each do |element|
    even_array << element if counter.odd?
    counter += 1
  end
  even_array
end

def delete_to_odd(array)
  odd_array = []
 (array.size/2 + 1).times do |element|
    odd_array << array.first
    array.slice!(0..1)
  end
  odd_array.compact
end


p delete_to_odd([1, 2, 3, 4, 5])
