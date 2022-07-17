# counts the instances of each occurences in an array

def count_occurrences(array)
  array.map!(&:downcase)

  array.uniq.each do |element|
    num = array.count(element)
    puts "#{element} => #{num}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
            'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
