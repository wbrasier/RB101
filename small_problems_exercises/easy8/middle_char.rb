def center_of(string)
  middle = ''
  middle_location = string.size / 2
  if string.size.even?
    middle << string[middle_location - 1]
  end
  middle << string[middle_location]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
