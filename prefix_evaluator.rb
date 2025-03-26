def evaluate_prefix(expression)
  tokens = expression.split.reverse
  stack = []
  valid_operators = ['+', '-', '*', '/']

  tokens.each do |token|
    case token
    when '+', '-', '*', '/'
      operand2 = stack.pop
      operand1 = stack.pop

      result = case token
        when '+' then operand1 + operand2
        when '-' then operand2 - operand1
        when '*' then operand1 * operand2
        when '/' then operand2 / operand1
      end
      stack.push(result)
    else
      # Convert to integer
      num = token.to_i
      # Return nil if not a positive number or if token isn't a pure number
      # and isn't a valid operator
      return nil if (num <= 0 || token.match?(/\D/)) && !valid_operators.include?(token)
      stack.push(num)
    end
  end

  stack[0]
end

# NOTE: uncomment this to use test cases

# test_cases = [
#   "9",                  # Valid: 9
#   "+ 1 2",              # Valid: 3
#   "+ + 1 2 30",         # Valid: 33
#   "+ + 12 16 * 10 4",   # Valid: 68
#   "- 10 5",             # Valid: 5
#   "* 6 7",              # Valid: 42
#   "/ 15 3",             # Valid: 5
#   "* + 2 3 4",          # Valid: 20
#   "- * 5 6 + 2 1",      # Valid: 27
#   "+ * 3 4 / 10 2",     # Valid: 17
#   "+ 0 5",              # Invalid: contains 0
#   "- 10 -5",            # Invalid: contains negative
#   "+ a 5",              # Invalid: contains non-number
#   "% 10 2",             # Invalid: invalid operator %
#   "^ 2 3",              # Invalid: invalid operator ^
#   "+ * 3 4 & 10 2"      # Invalid: invalid operator &
# ]

# test_cases.each do |expr|
#   result = evaluate_prefix(expr)
#   if result.nil?
#     puts "#{expr} => Invalid (contains non-positive numbers or invalid operators)"
#   else
#     puts "#{expr} => #{result}"
#   end
# end