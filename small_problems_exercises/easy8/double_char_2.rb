def double_consonants(string)
  doubled_consonants = ''
  string.chars.each do |char|
    doubled_consonants << char
    doubled_consonants << char if char.downcase =~ /[b-df-hj-np-tv-z]/
  end
  p doubled_consonants
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
