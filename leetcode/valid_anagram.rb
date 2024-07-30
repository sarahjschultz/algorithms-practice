def is_anagram(s, t)
  s_map = {}
  t_map = {}

  # Map the characters in the s string
  # To the number of times they appear
  s.each_char do |c|
    s_map[c].nil? ? s_map[c] = 1 : s_map[c] += 1
  end

  # Map the characters in the t string
  # To the number of times they appear
  t.each_char do |c|
    t_map[c].nil? ? t_map[c] = 1 : t_map[c] += 1
  end

  # If the characters in S appear at the same frequency as the characters in T AND
  # the characters in T appear at the same frequency as the characters in S
  # Then our strings are a valid anagram
  s_map.all? { |char, count| count == t_map[char] } && t_map.all? { |char, count| count == s_map[char] }
end

# s = "anagram"
# t = "nagaram"
#
# s = "rat"
# t = "car"

s = "a"
t = "ab"

is_anagram(s, t)
