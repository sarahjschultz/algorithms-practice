def is_palindrome(s)
  # Remove all non-alphanumeric chars
  # And downcase
  s = s.gsub(/[^a-zA-Z0-9]/, "").downcase

  pp s

  t = s.reverse

  pp t
  pp s == t
end

s = "A man, a plan, a canal: Panama"
# s = "race a car"
# s = " "
# s = "1a2"

is_palindrome(s)
