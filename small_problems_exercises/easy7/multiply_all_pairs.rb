def multiply_all_pairs(array_1, array_2)
  product_array = (array_1.product(array_2).map { |pair| pair.inject('*') }).sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
