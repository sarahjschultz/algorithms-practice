def can_construct(ransom_note, magazine)

  m_table = Hash.new { |k, v| k[v] = 0 }

  magazine.each_char do |c|
    m_table[c] += 1
  end

  ransom_note.each_char do |c|
    return false if m_table[c].zero?

    m_table[c] -= 1
  end

  true
end

ransom_note = "a"
magazine    = "b"

# ransom_note = "aa"
# magazine    = "ab"

# ransom_note = "aab"
# magazine    = "baa"

can_construct(ransom_note, magazine)
