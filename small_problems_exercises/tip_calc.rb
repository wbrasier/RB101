print 'What is the bill? '
bill_no_tip = gets.chomp.to_f

print 'What is the tip percentage? '
tip_percent = gets.chomp.to_f

tip = (bill_no_tip * tip_percent / 100)

total_bill = (tip + bill_no_tip)

puts "The tip is $#{format("%0.2f", tip).chomp}"
puts "The total is $#{format("%0.2f", total_bill).chomp}"
