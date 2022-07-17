def century(year)
  if year % 100 == 0
    century = year / 100
  else
    century = (year / 100) + 1
  end
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end


puts century(2000) 
puts century(2001)
puts century(1965)
puts century(256)
puts century(5)
puts century(10103)
puts century(1052) 
puts century(1127)
puts century(11201) 