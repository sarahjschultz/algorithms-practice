def lonely_integer(a)
  integer_hash = Hash.new { |k, v| k[v] = 0 }

  a.each do |el|
    integer_hash[el] += 1
  end

  pair = integer_hash.select { |_k, v| v == 1 }
  pair.keys.first
end

test_a = [0, 0, 1, 2, 1]
lonely_integer(test_a)
