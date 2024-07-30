def search(nums, target)
  left  = 0
  right = nums.length - 1

  while left <= right
    mid = (left + right) / 2

    return mid if nums[mid] == target

    if nums[left] <= nums[mid]
      if nums[left] <= target && target < nums[mid]
        right = mid - 1
      else
        left = mid + 1
      end
    else
      if nums[mid] < target && target <= nums[right]
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end
  -1
end

nums   = [4, 5, 6, 7, 0, 1, 2]
target = 0
search(nums, target)

# The pivot acts as an index shift (+ pivot mod length of array)
