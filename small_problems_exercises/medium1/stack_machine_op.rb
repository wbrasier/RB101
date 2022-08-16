def print(reg)
  puts "#{reg}"
end

def push(reg)
  puts reg
end

def minilang(string)
  register = 0
  stack = []
  arr = string.split(' ')
  arr.each_with_index do |element, index|
    
    case element
    # prints out register value
    when 'PRINT'
      print(register)
    # adds the register value to the stack
    when 'PUSH'
      stack << register
    # pops value from stack and the sum of the value and register is new register
    when 'MULT'
      register *= stack.pop
    # pops a value from the stack and adds it to register value
    when 'ADD'
      register += stack.pop
    # pops a value from the stack and subtracts it from register value
    when 'SUB'
      register -= stack.pop
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register %= stack.pop
    # topmost stack item is now register
    when 'POP'
      register = stack.pop
    end
    
    register = element.to_i if element.to_i.to_s == element
  end
end

minilang('6 PUSH')