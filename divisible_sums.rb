def divisible_sum_pairs(num_pairs, divisor, pairs)
  count_of_pairs = 0

  pairs.each_with_index do |el, i|
    pairs[(i + 1)..(num_pairs - 1)].each do |a|
      count_of_pairs += 1 if ((el.to_i + a.to_i) % divisor).zero?
    end
  end

  count_of_pairs
end

divisible_sum_pairs(6, 3, %w(1 3 2 6 1 2))
