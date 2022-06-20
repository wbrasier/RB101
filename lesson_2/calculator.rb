# ask user for 2 numbers using Kernel.gets().chomp()
# ask the user for operation to perform
# performs the operation on the two numbers
# output the result

LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file("config.calculator.yml")

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def number?(num)
  if num.include?('.')
    num.to_f.to_s == num
  else
    num.to_i.to_s == num
  end
end

def operation_to_message(op)
  operator_string = case op
                    when '1'
                      messages('adding')
                    when '2'
                      messages('subtracting')
                    when '3'
                      messages('multiplying')
                    when '4'
                      messages('dividing')
                    end
  operator_string
end

name = ''
loop do
  prompt('welcome')
  name = gets.chomp

  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

puts format(messages('hi'), name: name)

loop do
  number1 = nil
  loop do
    prompt('retrieve_num_1')
    number1 = gets.chomp

    if number? number1
      break
    else
      prompt('invalid_num')
    end
  end

  number2 = nil
  loop do
    prompt('retrieve_num_2')
    number2 = gets.chomp

    if number? number2
      break
    else
      prompt('invalid_num')
    end
  end

prompt('operator_prompt')

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include? operator
      break
    else
      prompt('must_choose')
    end
  end

operation = operation_to_message(operator)
puts format(messages('numbers_action'), operation: operation)

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              if number2.to_i == 0
                prompt('no_zero')
              else
                number1.to_f / number2.to_f
              end
            end

  puts format(messages('result'), result: result)

  prompt('another')
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt('goodbye')
