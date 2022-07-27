arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash = arr.each_with_object({}) do |sub_arr, hash|
  sub_arr.each_with_index do |object, index|
    if index == 0
      hash[object] = sub_arr[index + 1]
    else
      next
    end
  end
  hash
end

# the short solution
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end