def top_k_frequent_words(words, k)
  freq      = Array.new(words.length + 1) { [] }
  count_map = Hash.new(0)
  result    = []

  words.each do |w|
    count_map[w] += 1
  end

  count_map.each_pair do |word, count|
    freq[count] << word
    freq[count] = freq[count].sort
  end

  pp freq

  i = freq.length - 1

  while i >= 0
    freq[i].each do |w|
      result << w
      if result.length == k
        pp result
        return result
      end
    end

    i -= 1
  end
end

# words = ["i","love","leetcode","i","love","coding"]
# k = 2

# words = ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"]
# k     = 4
#
words = ["i", "love", "leetcode", "i", "love", "coding"]
k     = 3

top_k_frequent_words(words, k)
