# prints out '1' then '0' the length of a positive int

def stringy(int)
  string = ''
  counter = int 
  loop do
    if counter != 0
      string << '1'
      counter -= 1
    end
    if counter != 0
      string << '0'
      counter -= 1
    end
    break if counter == 0
  end
  string
end
  
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'