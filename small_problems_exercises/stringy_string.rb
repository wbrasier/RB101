# prints out '1' then '0' the length of a positive int

def stringy(int, start = 1)
  string = ''
  int.times do |index|
    if start == 1
      num = index.even? ? '1' : '0'
      string << num
    else
      num = index.even? ? '0' : '1'
      string << num
    end
  end
  string
end
  
puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'