def is_valid(s)
  return false if s.length.zero?
  return false if s.length.odd?

  valid = nil
  opening_chars = []

  s.each_char do |c|
    if ["(", "[", "{"].include?(c)
      pp "in opening char builder"
      opening_chars << c
    else
      pp c
      pp opening_chars.last
      case opening_chars.last
      when "("
        if c == ")"
          opening_chars.pop
          valid = true
        else
          valid = false
          break
        end
      when "["
        if c == "]"
          opening_chars.pop
          valid = true
        else
          valid = false
          break
        end
      when "{"
        if c == "}"
          opening_chars.pop
          valid = true
        else
          valid = false
          break
        end
      else
        valid = false
        break
      end
    end
  end

  pp opening_chars
  pp valid
  return false if opening_chars.length > 0

  valid
end

# s = "()"

# s = "(]"

# s = "()[]{}"

# s = "{[]}"
# s = "([)]"
# s = "([]){"
# s = "[[[]"
s = "{}{{}}"

is_valid(s)
