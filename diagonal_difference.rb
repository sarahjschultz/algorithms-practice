def diagonal_difference(arr)
  sum_1 = sum_2 = 0

  # left to right
  arr.each_with_index do |a, i|
    l = a.length

    sum_1 += a[i]
    sum_2 += a[l - i - 1]
  end

  (sum_1 - sum_2).abs
end

test_input = [[1, 1, 1], [0, 0, 0], [5, 5, 5]]
diagonal_difference(test_input)
