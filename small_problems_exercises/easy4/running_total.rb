def running_total(array)
  final_number = 0
  running_total_array = array.map do |int|
    final_number += int
  end
end

=begin
alternate solution:
def running_total(array)
  final_number = 0
  array.each_with_object([]) do |num, running_total_array|
    running_total_array << final_number += num
  end
end
=end
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []