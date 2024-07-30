def find_median(arr)
  sorted = arr.sort
  l      = sorted.length
  pp sorted[(l / 2)]
end

test_array = %w(0 1 2 4 6 5 3)

find_median(test_array)
