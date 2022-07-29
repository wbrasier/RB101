def buy_fruit(array)
  list = []
  array.each do |sub_arr|
    sub_arr[1].times do |fruit|
      list << sub_arr[0]
    end
  end
  p list
end

# alternative
def buy_fruit_alt(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
