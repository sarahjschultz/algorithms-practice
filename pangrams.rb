def pangrams(s)
  letters = {}
  ("a".."z").each { |l| letters[l] = 0 }

  s.split.join.chars.each do |c|
    letters[c.downcase] += 1
  end

  letters.any? {|_k, v| v.zero? } ? "not pangram" : "pangram"
end

test_s = "We promptly judged antique ivory buckles for the next prize"

pangrams(test_s)
