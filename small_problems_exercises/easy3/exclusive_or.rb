def xor?(bool_1, bool_2)
  return true if bool_1 && !bool_2
  return true if bool_2 && !bool_1
  false
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
