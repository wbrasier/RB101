def multiply_list(array_1, array_2)
  product_array = []
  counter = 0
  loop do
    product_array << (array_1[counter] * array_2[counter])
    counter += 1
    break if counter >= array_1.size
  end
  product_array
end 

# alternative solution
def multiply_list_alternative(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end

#further exploration
def multiply_list_alternative_2(array_1, array_2)
  array_1.zip(array_2).map { |pair| pair.inject('*') }
end

puts multiply_list_alternative_2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
