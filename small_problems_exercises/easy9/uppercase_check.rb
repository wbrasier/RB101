def uppercase?(string)
  string.upcase == string
end

# with regexp alternative solution
def uppercase_alt?(string)
  return false if string.match?(/[a-z]/)
  true
end


p uppercase_alt?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
