def greetings (name_arr, hash)
  name = name_arr.join(' ')
  puts "Hello, #{name}!"
  puts "Nice to have a #{hash[:title]} #{hash[:occupation]} around!"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
