WORD_TO_INT = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
              'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 
              'nine' => '9', 'zero' => '0' }

def word_to_digit(string)
  WORD_TO_INT.keys.each do |number_word|
    string.gsub!(/\b#{number_word}\b/, WORD_TO_INT[number_word])
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')