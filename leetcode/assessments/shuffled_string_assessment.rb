def restore_string(s, indices)

  s_map = s.chars

  restored = []

  indices.each_with_index do |destination, i|
    char = s_map[i]
    restored[destination] = char
  end

  restored.join
end

# s       = "abc"
# indices = [0, 1, 2]

s       = "codeleet"
indices = [4, 5, 6, 7, 0, 2, 1, 3]
# LC says output should be leetcode but it is actually "leetcdoe"

restore_string(s, indices)
