def get_grade(grade_1, grade_2, grade_3)
  average = (grade_1 + grade_2 + grade_3) / 3
  case 
  when average >= 90 && average <= 100
    'A'
  when average < 90 && average >= 80
    'B'
  when average < 80 && average >= 70
    'C'
  when average < 70 && average >= 60
    'D'
  else
    'F'
  end
end 

# better case statement solution
def get_grade_alt(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  p case result
  when 90..    then 'A' # the lack of a second number is for grades over 100
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

p get_grade_alt(95, 90, 93) == "A"
p get_grade_alt(50, 50, 95) == "D"
