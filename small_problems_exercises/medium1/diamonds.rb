def diamond(int)
  print_top_half(int)
  print_bottom_half(int)
end

def print_top_half(int)
  stars = 1
  loop do
    string = "*" * stars
    puts string.center(int)
    stars += 2
    break if stars > int
  end
end

def print_bottom_half(int)
  stars = int - 2
  loop do
    string = "*" * stars
    puts string.center(int)
    stars -= 2
    break if stars < 0
  end
end

diamond(5)
diamond(3)