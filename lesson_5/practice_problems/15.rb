arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]


p (arr.select do |sub_hash|
  (sub_hash.all? do |_, value|
    value.all? { |int| int.even? }
  end)
end)