# HASH
def length_of_longest_substring(s)
  map   = {}
  max   = 0
  left  = 0
  right = 0

  while right < s.length
    char = s[right]

    map[char].nil? ? map[char] = 1 : map[char] += 1

    # Compact the window if there is a dup
    while map[char] > 1
      prior_char      = s[left]
      map[prior_char] -= 1
      left            += 1
    end

    max = [max, right - left + 1].max

    # Always expand the window
    right += 1
  end

  pp max
end

# SET
def length_of_longest_substring(s)
  max      = 0
  char_set = Set.new()
  left     = 0
  right    = 0

  while right < s.length
    while char_set.include?(s[right])
      char_set.delete(s[left])
      left += 1
    end

    char_set.add(s[right])
    max   = [max, char_set.length].max
    right += 1
  end
  max
end

# s = "abcabcbb" #3
# s = "bbbbb" #1
# s = "pwwkew" #3
# s = "aab" #2
# s = "dvdf" #3

length_of_longest_substring(s)
