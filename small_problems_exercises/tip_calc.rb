print 'What is the bill? '
bill_no_tip = gets.chomp.to_f

print 'What is the tip percentage? '
tip_percent = gets.chomp.to_f

tip = (bill_no_tip * tip_percent / 100)
tip = tip.to_f.round(2)

total_bill = (tip + bill_no_tip)
total_bill = total_bill.round(2)

puts "The tip is $#{tip}"
puts "The total is $#{total_bill}"
