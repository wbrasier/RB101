def featured(int)
  starting_multiplier = int / 7
  num = 7 * (starting_multiplier + 1)
  loop do
    if num.even? || num.to_s.chars != num.to_s.chars.uniq
      num += 7
    else
      return num
    end
    break if num >= 9_876_543_210
  end
  'There is no featured number that large!'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
