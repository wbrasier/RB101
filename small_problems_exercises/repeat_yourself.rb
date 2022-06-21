#also possible to simply do int.times { puts phrase }
def repeat(phrase, int)
  int.times { puts phrase}
end

def prompt(text)
  puts "=> #{text}"
end

def validate_int(integer)
  (integer.to_f == integer.to_i) && integer.to_i.positive?
end

string = ''
loop do
  prompt('What would you like repeated?')
  string = gets.chomp

  if string.empty?
    prompt('You must input something!')
  else
    break
  end
end

num = ''
loop do
  prompt('How many times would you like it repeated?')
  num = gets.chomp
  if validate_int(num)
    repeat(string, num.to_i)
    break
  else
    prompt('You must input a positive integer!')
  end
end
