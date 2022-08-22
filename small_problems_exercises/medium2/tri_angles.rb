def triangle(angle1, angle2, angle3)
  arr = [angle1, angle2, angle3]
  case
  when arr.include?(0) || arr.sum != 180
    :invalid
  when arr.include?(90)
    :right
  when arr.select { |angle| angle < 90 }.size == 3
    :acute
  when arr.select { |angle| angle > 90}.size == 1
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
