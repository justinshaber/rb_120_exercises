class MinilangError < StandardError; end
class InvalidCommandError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  COMMANDS = %w(ADD SUB MULT DIV MOD PUSH POP PRINT)

  attr_accessor :reg_val, :stack
  attr_reader :string

  def initialize(string)
    @reg_val = 0
    @stack = []
    @string = string
  end

  def eval
    string.split(" ").each do |command|
      eval_command(command)
    end
  rescue MinilangError => e
    puts e.message
  end

  def eval_command(command)
    if COMMANDS.include?(command) || valid_int?(command)
      execute_command(command)
    else
      raise InvalidCommandError, "Invalid Command: #{command}" 
    end
  end

  def execute_command(command)
    case command
    when 'ADD'   then self.reg_val += pop
    when 'SUB'   then self.reg_val -= pop
    when 'MULT'  then self.reg_val *= pop
    when 'DIV'   then self.reg_val /= pop
    when 'MOD'   then self.reg_val %= pop
    when 'POP'   then self.reg_val = pop
    when 'PUSH'  then stack << reg_val
    when 'PRINT' then puts reg_val
    else              self.reg_val = command.to_i
    end
  end

  def pop
    raise EmptyStackError, "Empty stack!" if stack.empty? 
    stack.pop
  end

  def valid_int?(command)
    command == command.to_i.to_s
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

# def eval
  #   string.split(" ").each do |command|
  #     begin
  #       validate_command(command)
  #     rescue InvalidCommandError => e
  #       puts e.message
  #       return
  #     end

  #     if command == 'PUSH'
  #       stack << reg_val
  #       next
  #     end
  
  #     if command == 'PRINT'
  #       puts reg_val
  #       next
  #     end
  
  #     if valid_int?(command)
  #       self.reg_val = command.to_i
  #       next
  #     end
  
  #     begin
  #       empty_stack?
  #     rescue EmptyStackError => e
  #       puts e.message
  #       return
  #     end

  #     execute_command(command)
  #   end
  # end