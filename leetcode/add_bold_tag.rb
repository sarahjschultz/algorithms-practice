def add_bold_tag(s, words)
  # Boolean array storing values for whether or not a character at a given index
  # Should be bold. Initially, all values are false.
  bold = Array.new(s.length, false)

  # Find all of the instances of our words
  # within the string and update our bold store to track them
  words.each do |word|
    # find the index where the word begins in our string,
    # with an offset of 0 because we want to look at the beginning
    found = s.index(word, 0)
    prev_bolded = 0
    until found.nil?
      start = [found, prev_bolded].max
      prev_bolded = found+word.length
      (start...prev_bolded).each do |i|
        bold[i] = true
      end
      found = s.index(word, start+1)
    end
  end

  result = ""
  open = false
  (0...s.length).each do |i|
    if bold[i] && !open
      result += '<b>'
      open = true
    elsif !bold[i] && open
      result+= '</b>'
      open = false
    end
    result += s[i]
  end
  result += '</b>' if open
  result
end

s     = "abcxyz123"
words = ["abc", "123"]
#
# s     = "aaabbb"
# words = ["aa", "b"]
puts add_bold_tag(s, words)
