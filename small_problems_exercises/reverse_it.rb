# prints out a string in the reverse order
=begin
or simply do
def reverse_sentence(string)
  string.split.reverse.join(' ')
end
=end

def reverse_sentence(phrase)
  array = phrase.split(' ')
  string = ''
  if array !empty?
    loop do
      break if array.empty?

      string << array.pop + ' '
    end
    string.rstrip!
  elsif array.empty?
    ''
  end
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == ''
