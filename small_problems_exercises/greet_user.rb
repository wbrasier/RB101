puts "What is your name?"
name = gets.chomp.capitalize

if name.include?('!')
  puts "HELLO #{name.upcase} WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end