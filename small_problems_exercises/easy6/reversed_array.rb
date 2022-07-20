def reverse!(list)
  hash = {}
  unless list.empty?
    list.each_with_index do |element, index|
      hash[element] = index
    end
    new_index = 0
    original_index = list.size - 1
    loop do
      list[new_index] = hash.key(original_index)
      new_index += 1
      original_index -= 1
      break if new_index == list.size
    end
  end
  list
end


list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true

