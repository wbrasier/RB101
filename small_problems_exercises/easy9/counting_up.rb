def sequence(int)
  if int >= 1
    (1..int).each_with_object([]) { |num, array| array << num }
  else
    (int..1).to_a # further exploration for if the input int is negative
  end
end

# alternative solution
def sequence_alt(number)
  (1..number).to_a
end

p sequence(-2) # == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
