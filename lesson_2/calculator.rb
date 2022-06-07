# ask user for 2 numbers using Kernel.gets().chomp()
# ask the user for operation to perform
# performs the operation on the two numbers
# output the result

=begin
def prompt(message)
  Kernel.puts "=> #{message}"
end
=end
require 'yaml'

conf = YAML.load_file("config.calculator.yml")


def number?(num)
    if num.include?('.')
      num.to_f.to_s == num
    else 
      num.to_i.to_s == num 
    end
end

def operation_to_message(op)
  conf = YAML.load_file("config.calculator.yml")
  operator_string = case op
                    when '1'
                      conf.fetch(:adding)
                    when '2'
                      conf.fetch(:subtracting)
                    when '3'
                      conf.fetch(:multiplying)
                    when '4'
                      conf.fetch(:dividing)
                    end
  operator_string 
end

name = ''
loop do
  puts conf.fetch(:welcome)
  name = Kernel.gets.chomp

  if name.empty?
    puts conf.fetch(:valid_name)
  else
    break
  end
end

puts conf.fetch(:hi) + " #{name}!"

loop do
  number1 = nil
  loop do
    puts conf.fetch(:retrieve_num_1)
    number1 = Kernel.gets.chomp

    if number? number1
      break
    else
      puts conf.fetch(:invalid_num)
    end
  end

  number2 = nil
  loop do
    puts conf.fetch(:retrieve_num_2)
    number2 = Kernel.gets.chomp

    if number? number2
      break
    else
      puts conf.fetch(:invalid_num)
    end
  end

puts conf.fetch(:operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets.chomp

    if %w(1 2 3 4).include? operator
      break
    else
      puts conf.fetch(:must_choose)
    end
  end

  puts "#{operation_to_message(operator)} " + conf.fetch(:numbers_action)
  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              if number2.to_i == 0
                puts conf.fetch(:no_zero)
              else
                number1.to_f / number2.to_f
              end
            end
  puts conf.fetch(:result) + " #{result}" unless operator == '4'
  puts conf.fetch(:another)
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with? 'y'
end

puts conf.fetch(:goodbye)
