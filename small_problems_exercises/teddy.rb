# random number generator for Teddy's age

def prints_statement(string)
  age = rand(20..200)
  puts "#{string}'s' age is #{age} years old!"
end

puts "What is your name?"

name = gets.chomp.capitalize
name = 'Teddy' if name == ''

prints_statement(name)
