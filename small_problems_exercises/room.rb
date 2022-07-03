SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.03

print 'Enter the length of the room in feet:'
length = gets.chomp.to_f

print 'Enter the width of the room in feet:'
width = gets.chomp.to_f

area_f = length * width

area_i = area_f * SQFEET_TO_SQINCHES
area_cm = area_f * SQFEET_TO_SQCM

puts "The area of the room is #{area_f.round} square feet (#{area_i.round} 
      square inches, #{area_cm.round} square cm)."
