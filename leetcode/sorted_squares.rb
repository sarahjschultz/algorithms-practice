def sorted_squares(nums)
  return 0 if nums.empty?
  return nums.first * nums.first if nums.length == 1

  sorted_squares = Array.new(nums.size)
  left           = 0
  right          = nums.length - 1
  writer         = nums.length - 1

  while left < nums.length && right >= 0 && writer >= 0

    if nums[right].abs > nums[left].abs
      sorted_squares[writer] = (nums[right] * nums[right])
      right                  -= 1
    else
      sorted_squares[writer] = (nums[left] * nums[left])
      left                   += 1
    end
    writer -= 1
  end

  pp sorted_squares
end

def sorted_squares(nums)
  return nums if nums.empty?
  return [nums.first * nums.first] if nums.length == 1

  answers = []
  left    = 0
  right   = nums.length - 1

  while left < right && right >= 0
    pp nums[left].abs
    pp nums[right].abs
    if nums[left].abs > nums[right].abs
      pp "left"
      answers.unshift(nums[left] * nums[left])
      left += 1
    else
      pp "right"
      answers.unshift(nums[right] * nums[right])
      right -= 1
    end
  end
  pp answers
end

# nums = [-4, -1, 0, 3, 10]
# Output: [0,1,9,16,100]

# nums = [-7,-3,2,3,11]
# Output: [4,9,9,49,121]

nums = [0, 2]
# Output: [0, 4]

sorted_squares(nums)

