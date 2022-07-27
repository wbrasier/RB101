def fizzbuzz(start, final)
  (start..final).each do |num|
    if num % 3 == 0 && num % 5 == 0
      puts "FizzBuzz"
    elsif num % 5 == 0
      puts "Buzz"
    elsif num % 3 == 0
      puts "Fizz"
    else
      puts num
    end
  end
end

def fizzbuzz_case_statement(start, final)
  (start..final).each do |num|
    case 
    when num % 3 == 0 && num % 5 == 0
      puts "FizzBuzz"
    when num % 5 == 0
      puts "Buzz"
    when num % 3 == 0
      puts "Fizz"
    else
      puts num
    end
  end
end

fizzbuzz_case_statement(1, 15)