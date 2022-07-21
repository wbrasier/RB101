# right corner in the bottom right of the screen
def right_triangle(int)
  triangle_rows = []
  stars = 1
  loop do
    triangle_rows << ("#{'*' * stars}".rjust(int) )
    stars += 1
    break if triangle_rows.length >= int
  end
  triangle_rows
end

# further exploration is everything below
# upside down right corner is top right of the screen
def upside_down_triangle(int)
    triangle_rows = []
  stars = 1
  loop do
    triangle_rows << ("#{'*' * stars}".rjust(int) )
    stars += 1
    break if triangle_rows.length >= int
  end
  triangle_rows.reverse
end

# right corner is in the bottom left of the screen
def left_triangle(int)
  triangle_rows = []
  stars = 1
  loop do
    triangle_rows << ("#{'*' * stars}" )
    stars += 1
    break if triangle_rows.length >= int
  end
  triangle_rows
end

# right corner is in the top left of the screen
def upside_down_left_triangle(int)
  triangle_rows = []
  stars = 1
  loop do
    triangle_rows << ("#{'*' * stars}" )
    stars += 1
    break if triangle_rows.length >= int
  end
  triangle_rows.reverse
end

puts upside_down_left_triangle(5)
puts upside_down_left_triangle(9)
