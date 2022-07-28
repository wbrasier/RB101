def negative(int)
  int <= 0 ? int: (-int)
end

# their alternative solution
def negative_alt(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative_alt(0) == 0
