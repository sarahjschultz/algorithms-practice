def move_zeroes(nums)
  return nums if [0, 1].include?(nums.length)

  i = j = 0
  while i < nums.length
    while j < nums.length
      unless nums[j].zero?
        nums[i] = nums[j]
        i       += 1
      end
      j += 1
    end

    break if i > nums.length - 1

    nums[i] = 0
    i       += 1
  end
  pp nums
end
# nums = [0, 1]

nums = [0, 1, 0, 3, 12]

# nums = [2, 1]

move_zeroes(nums)
