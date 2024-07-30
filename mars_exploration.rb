def mars_exploration(s)
  msg_count = s.length / 3
  expected = "SOS" * msg_count

  mutated = 0
  s.chars.each_with_index do |c, i|
    c == expected[i] ? next : mutated += 1
  end

  mutated
end

# test_string = "SOSOOSOSOSOSOSSOSOSOSOSOSOS"
test_string = "SOSSPSSQSSOR"

mars_exploration(test_string)

# test_string = "SOSOOSOSOSOSOSSOSOSOSOSOSOS"
# 12

# test_string = "SOSSPSSQSSOR"
# 3
