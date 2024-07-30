def product_except_self(nums)
  return nums if [0, 1].include?(nums.length)

  answer     = []
  from_left  = [] # this is called a prefix
  from_right = [] # this is called a suffix

  # Traverse from the left to preprocess and build rolling product
  # From the left
  i = 0
  while i < nums.length
    from_left[i] = i.zero? ? nums[i] : nums[i] * from_left[i - 1]
    i            += 1
  end

  # Traverse from the right to preprocess and build rolling product
  # From the right
  j = nums.length - 1
  while j > -1
    from_right[j] = j == nums.length - 1 ? nums[j] : nums[j] * from_right[j + 1]
    j             -= 1
  end

  # Multiplication is associative, so to get any total product = from_left * n * from_right
  # Thus, to build our answer array, we simply need to multiply from_left * from_right
  # Skipping n
  nums.each_with_index do |_n, ind|
    answer[ind] = if ind.zero?
                    from_right[ind + 1]
                  elsif ind == nums.length - 1
                    from_left[ind - 1]
                  else
                    from_left[ind - 1] * from_right[ind + 1]
                  end
  end

  answer
end

# nums = [-1, 1, 0, -3, 3]
# # [0,0,9,0,0]

nums = [1, 2, 3, 4]
[24, 12, 8, 6]
product_except_self(nums)
