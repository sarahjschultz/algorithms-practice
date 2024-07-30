def remove_element(nums, val)
  i           = 0
  j           = nums.length - 1
  match_count = 0
  while i < nums.length
    if nums[i] == val
      if nums[j] == val
        nums[j] = nil
      else
        nums[i] = nums[j]
        nums[j] = nil
        i += 1
      end
      match_count += 1
      j           -= 1
    else
      i += 1
    end
  end

  pp nums
  pp nums.length - match_count
end

# nums = [3,2,2,3]
# val = 3

nums = [0, 1, 2, 2, 3, 0, 4, 2]
val  = 2

remove_element(nums, val)
