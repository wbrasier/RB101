def staggered_case(string)
  counter = 0
  characters = string.chars.map! do |char|
    if char =~ /[a-z]/i && counter.even?
      counter += 1
      char.upcase
    elsif char =~ /[a-z]/i && counter.odd?
      counter += 1
      char.downcase
    else
      char
    end
  end
  p characters.join
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
