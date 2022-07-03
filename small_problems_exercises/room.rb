SQMETERS_TO_SQFEET = 10.7639

print "Enter the length of the room in meters:"
length = gets.chomp.to_f

print "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_m = length * width

area_f = area_m * SQMETERS_TO_SQFEET

puts "The area of the room is #{area_m.round} square meters (#{area_f.round} square feet)."
