def reverse_vowels(s)
  vowels = %w(a e i o u A E I O U)
  answer = []

  ordered_vowels = []

  s.each_char do |c|
    ordered_vowels << c if vowels.include?(c)
  end

  i = 0
  while i < s.length
    c = s[i]
    if vowels.include?(c)
      answer << ordered_vowels.pop
    else
      answer << c
    end
    i += 1
  end

  answer.join
end

s = "hello"
reverse_vowels(s)
