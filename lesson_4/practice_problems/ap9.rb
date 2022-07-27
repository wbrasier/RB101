words = "the flintstones rock"

def titleize(string)
  words = string.split.each { |word| word.capitalize! }.join(" ")
end

puts titleize(words)