def repeater(string)
  double_string = ''
  string.chars.each do |char|
    double_string << char * 2
  end
  p double_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
