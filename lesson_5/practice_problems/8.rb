hsh = {
      first: ['the', 'quick'], 
      second: ['brown', 'fox'], 
      third: ['jumped'], 
      fourth: ['over', 'the', 'lazy', 'dog']
      }

hsh.each do |_, array_of_strings|
 array_of_strings.each do |string|
   string.chars.each do |letter|
     puts letter if letter =~ /[aeiou]/i
   end
 end
end
