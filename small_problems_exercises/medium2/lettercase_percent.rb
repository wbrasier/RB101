def letter_percentages(string)
  percentages = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  percentages[:lowercase] = string.count('a-z').to_f
  percentages[:uppercase] = string.count('A-Z').to_f
  percentages[:neither] = string.count('^a-zA-Z').to_f
  
  percentages.each do |type, count|
    percent = ( count / string.length.to_f ) * 100.0
    percentages[type] = format("%0.1f", percent).to_f
  end
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')