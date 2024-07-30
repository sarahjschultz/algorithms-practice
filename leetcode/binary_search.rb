def search(nums, target)
  left  = 0
  right = nums.length - 1

  solution = -1

  while left <= right
    midpoint = (left + right) / 2

    if nums[midpoint] == target
      solution = midpoint
    elsif nums[midpoint] < target
      left = midpoint + 1
    else
      right = midpoint - 1
    end
  end
  solution
end

nums   = [-1, 0, 3, 5, 9, 12]
target = 9

# nums = [-1,0,3,5,9,12]
# target = 2
search(nums, target)

