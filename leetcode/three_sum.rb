def three_sum(nums)
  solution = []

  # Sort the input array
  nums.sort!

  nums.each_with_index do |n, i|
    next if i.positive? && n == nums[i + 1]

    # Now solve Two Sum
    left  = i + 1
    right = nums.length - 1

    while left < right
      sum = n + nums[left] + nums[right]

      if sum.positive?
        right -= 1
      elsif sum.negative?
        left += 1
      else
        solution << [n, nums[left], nums[right]]
        left += 1

        while nums[left] == nums[left - 1] && left < right
          left += 1
        end
      end
    end
  end

  pp solution
end

nums = [-1, 0, 1, 2, -1, -4]
three_sum(nums)
