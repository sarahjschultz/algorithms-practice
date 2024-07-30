def eval_rpn(tokens)
  operators = %w(+ - * /)
  stack     = []

  tokens.each do |token|

    stack << token unless operators.include?(token)

    next unless operators.include?(token)

    right = stack.pop
    left  = stack.pop

    case token
    when "+"
      stack << left.to_i + right.to_i
    when "-"
      stack << left.to_i - right.to_i
    when "*"
      stack << left.to_i * right.to_i
    else
      stack << (left.to_f / right.to_i).truncate
    end
  end
  pp stack.pop
end

# tokens = ["2", "1", "+", "3", "*"] # 9
# tokens = ["4", "13", "5", "/", "+"] # 6
tokens = ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"] # 22

eval_rpn(tokens)
