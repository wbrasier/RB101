PAIRS = ['()', '[]', "''", "“”", '{}']

def balanced?(string)
  arr = string.chars
  matches = ''
  PAIRS.each do |pair|
    next if !arr.include?(pair[0]) && !arr.include?(pair[1])
   matches = arr.select { |char| char == pair[0] || char == pair[1] }.join
    loop do
      matches.gsub!(pair, '')
      break if matches.length <= 1 || matches.start_with?(pair[1])
    end
  end
  matches.length == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false

p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?("He said, “I like turtles”.") == true
p balanced?("He said, “I like turtles.") == false
p balanced?("He said, I like turtles”.") == false
p balanced?("He said, ‘I like turtles’.") == true
p balanced?("“He said, ‘I like turtles’.”") == true
p balanced?('What [(is)] this?') == true
p balanced?('What [(is) this?') == false
p balanced?("He said, ‘I like turtles’.") == true
p balanced?("PHe said, ‘I like turtles’.P") == true
p balanced?('({What [(is) this]?)}') == true 
p balanced?('What [(is]) this?') == true