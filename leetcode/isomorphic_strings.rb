# def is_isomorphic(s, t)
#   s_to_t = {}
#   t_to_s = {}
#
#   result = true
#   s.each_char.with_index do |char, i|
#     if s_to_t[char].nil? && t_to_s[t[i]].nil?
#       s_to_t[char] = t[i]
#       t_to_s[t[i]] = char
#     end
#
#     if !s_to_t[char].nil? && s_to_t[char] != t[i]
#       result = false
#     end
#
#     if !t_to_s[t[i]].nil? && t_to_s[t[i]] != char
#       result = false
#     end
#   end
#   result
#
# end

def is_isomorphic(s, t)
  transform(s) == transform(t)
end

def transform(str)
  hash = {}
  str.each_char.with_index.map do |ch, i|
    hash[ch] ||= i
  end.join(' ')
  pp hash
end

# true
# s = "egg"
# t = "add"

# false
# s = "foo"
# t = "bar"

# false
s = "bbbaaaba"
t = "aaabbbba"

# false
# s = "badc"
# t = "baba"

# false
# s = "leet"
# t = "code"

is_isomorphic(s, t)
