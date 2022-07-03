print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

years_left = retirement_age - age

year = Time.now.year

retirement_year = year + years_left

puts "It's #{year}. You will retire in #{retirement_year}."
puts "You have only #{years_left} years of work to go!"