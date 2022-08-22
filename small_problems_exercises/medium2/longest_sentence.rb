
text = File.read("longest_sentence_text.txt")

def longest_sentence(txt)
  sentences = txt.split(/\.|\?|!/)
  longest_sentence = ''
  longest_length = 0
  sentences.each do |sentence|
    sentence_length = sentence.split(' ').count
    if sentence_length > longest_length
      longest_sentence = sentence
      longest_length = sentence_length
    else
      next
    end
  end
  "#{longest_sentence} is the longest sentence with #{longest_length} words."
end

puts longest_sentence(text)