# NOTE: If the array does not contain negative numbers then the solution is trivial
# Because the maxium subarray is the entire array
#
# We'll solve this with Kadane's Algorithm in O(n)
def max_sub_array(nums)
  return nums.first if nums.length == 1

  best_sum    = -Float::INFINITY
  current_sum = 0

  nums.each do |n|
    # If n is greater, let's start the subarray over
    if n > current_sum + n
      current_sum = n
    else
      # If adding is greater than the number we're looking at
      # add it to the pile
      current_sum = current_sum + n
    end

    if current_sum > best_sum
      best_sum = current_sum
    end
  end

  pp best_sum
end

nums = [5, 4, -1, 7, 8]
# 23

max_sub_array(nums)
