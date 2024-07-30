def breakingRecords(scores)
  last_i = scores.length - 1
  min = [scores[0], 0]
  max = [scores[0], 0]

  scores[1..last_i].each do |s|
    if s > max[0]
      max[0] = s
      max[1] += 1
    elsif s < min[0]
      min[0] = s
      min[1] += 1
    end
  end

  pp [max[1], min[1]]
end

breakingRecords(%w(3 4 21 36 10 28 35 5 24 42))
