def reverse(original_array)
  new_array = []
  counter = -1
  return new_array if original_array.empty?
  loop do
    new_array << original_array[counter]
    counter -= 1
    break if new_array.size == original_array.size
  end
  new_array
end 

# also possible to simply use reverse_each which is each but in reverse order

def reverse_alternate(original_array)
  new_array = original_array.each_with_object([]) { |element, a| a.prepend(element) }
end

puts reverse_alternate([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse_alternate(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse_alternate(['abc']) == ['abc']              # => true
puts reverse_alternate([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
