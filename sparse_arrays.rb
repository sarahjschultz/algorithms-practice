def matching_strings(str, qry)
  counts = []
  qry.each_with_index do |q, i|
    counts[i] = str.count do |s|
      s.eql? q
    end
  end

  counts
end

strings = %w(aba baba aba xzxb)
queries = %w(aba xzxb ab)

matching_strings(strings, queries)

