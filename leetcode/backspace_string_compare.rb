def backspace_compare(s, t)
  formatted_s = ""
  formatted_t = ""

  i = j = 0

  while i < s.length
    if s[i] == '#'
      formatted_s = formatted_s.chop
    else
      formatted_s << s[i]
    end

    i += 1
  end

  while j < t.length
    if t[j] == '#'
      formatted_t = formatted_t.chop
    else
      formatted_t << t[j]
    end

    j += 1
  end

  pp formatted_s
  pp formatted_t
  pp formatted_s == formatted_t
end

# s = "ab#c"
# t = "ad#c"

# s = "ab##"
# t = "c#d#"

s = "a##c"
t = "#a#c"
backspace_compare(s, t)
