def staggered_case(string)
  characters = string.chars.each_with_index do |char, index|
    if index.even?
      char.upcase!
    elsif index.odd?
      char.downcase!
    else
      char
    end
  end
  characters.join
end

# alternative further exploration
def staggered_case_alternative(string, need_upper)
  result = ''
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

puts staggered_case_alternative('I Love Launch School!', false)
puts staggered_case_alternative('ALL_CAPS', true)
puts staggered_case_alternative('ignore 77 the 444 numbers', false)
