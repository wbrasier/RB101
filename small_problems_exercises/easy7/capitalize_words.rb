def word_cap(string)
  words = string.split.map(&:capitalize).join(' ')
end

# further exploration 1
def word_cap_alternative(string)
  words = string.split.map(&:chars)
  words.map! do |word|
    counter = 0
    loop do
      if counter == 0 
        word[counter].upcase!
      else
        word[counter].downcase!
      end
      counter += 1
      break if counter >= word.length
    end
    word.join
  end
  words.join(' ')
end

puts word_cap_alternative_2('four score and seven') == 'Four Score And Seven'
puts word_cap_alternative_2('the javaScript language') == 'The Javascript Language'
puts word_cap_alternative_2('this is a "quoted" word') == 'This Is A "quoted" Word'
