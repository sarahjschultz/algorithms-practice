def longest_common_prefix(strs)
  return "" if strs.length.zero?

  result    = ""
  first_str = strs.first

  i = 0
  while i < first_str.length
    strs.each do |s|
      if i == s.length || s[i] != first_str[i]
        return result
      end
    end
    result << first_str[i]
    i += 1
  end

  result
end

# strs = ["flower", "flow", "flight"] # "fl"
# strs = ["dog", "racecar", "car"] # ""
strs = ["a"] # "a"
longest_common_prefix(strs)
