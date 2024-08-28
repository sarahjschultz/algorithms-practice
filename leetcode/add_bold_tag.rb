def add_bold_tag(s, words)
  # Boolean array storing values for whether or not a character at a given index
  # Should be bold. Initially, all values are false.
  bold_flag = Array.new(s.length, false)

  current_end = 0

  # Find all of the instances of our words
  # within the string and update our bold store to track them

  i = 0
  while i < s.length
    words.each do |word|
      if s[i..].start_with?(word)
        current_end = [current_end, i + word.length].max
      end

    end

    bold_flag[i] = i < current_end
    i            += 1
  end
  pp bold_flag

  ans = ""

  bold_flag.each_with_index do |flag, ind|
    if flag
      if ind.zero? || !bold_flag[ind - 1]
        ans += "<b>"
      end

      ans += s[ind]

      if ind == s.length - 1 || !bold_flag[ind + 1]
        ans += "</b>"
      end
    else
      ans += s[ind]
    end
  end
  ans
end

s     = "abcxyz123"
words = ["abc", "123"]
#
# s     = "aaabbb"
# words = ["aa", "b"]
pp add_bold_tag(s, words)
