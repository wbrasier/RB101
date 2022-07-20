def print_in_box(string)
  width = string.length
  top_bottom = '+-' + ('-' * width) + '-+'
  middle = '| ' + (' ' * width) + ' |'
  phrase = '| ' + string + ' |'
  
  puts top_bottom
  puts middle
  puts phrase
  puts middle
  puts top_bottom
end

print_in_box('Hello there. I am writing.')