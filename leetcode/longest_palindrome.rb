def longest_palindrome(s)
  char_counts = Hash.new(0)
  has_odd     = false
  sum         = 0

  s.each_char do |c|
    char_counts[c].nil? ? char_counts[c] = 1 : char_counts[c] += 1
  end

  char_counts.values.each do |val|
    if (val % 2).zero?
      sum += val
    else
      sum += (val - 1)
      has_odd ||= true
    end
  end

  pp has_odd ? sum += 1 : sum
end

# s = "abccccdd" #7
# s = "ccc" #3
s = "bananas" #5

longest_palindrome(s)
