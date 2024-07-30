def sorted_squares(nums)
  low  = 0
  high = nums.length - 1

  solution = []

  while low <= high
    low_abv = nums[low].abs
    high_abv = nums[high].abs


    if low_abv > high_abv
      solution.unshift(low_abv * low_abv)
      low += 1
    else
      solution.unshift(high_abv * high_abv)
      high -= 1
    end
  end
  pp solution
end

nums = [-4, -1, 0, 3, 10]
# Output: [0,1,9,16,100]

# nums = [-7,-3,2,3,11]
# Output: [4,9,9,49,121]

# nums = [0, 2]
# Output: [0, 4]

sorted_squares(nums)

