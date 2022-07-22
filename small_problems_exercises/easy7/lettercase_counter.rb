def letter_case_count(string)
  case_count = { lowercase: 0, uppercase: 0, neither:0 }
  case_count[:lowercase] = string.count('a-z')
  case_count[:uppercase] = string.count('A-Z')
  case_count[:neither] = string.count('^A-Za-z')
  case_count
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
