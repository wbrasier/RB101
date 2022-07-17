def two_decimal_places(int)
  format("%0.2f", int)
end

print 'What is the bill? '
bill_no_tip = gets.chomp.to_f

print 'What is the tip percentage? '
tip_percent = gets.chomp.to_f

tip = (bill_no_tip * tip_percent / 100)

total_bill = (tip + bill_no_tip)

puts "The tip is $#{two_decimal_places(tip)}"
puts "The total is $#{two_decimal_places(total_bill)}"
