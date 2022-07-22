def swapcase(string)
  swapcase_string = string.chars.map! do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  p swapcase_string.join
end

# alternative solution I like
def swapcase_alternative(str)
  str.chars.map {|chr| chr == chr.downcase ? chr.upcase : chr.downcase}.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
