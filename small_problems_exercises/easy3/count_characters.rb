print "Please write word or multiple words: "
string = gets.chomp

characters = string.chars

characters.delete_if { |char| char == ' ' }

num_characters = characters.length

puts %Q(There are #{num_characters} characters in "#{string}")
