statement = "The Flintstones Rock"
hash = {}

array = statement.chars
array.each do |letter|
  hash[letter] = array.count(letter)
end
