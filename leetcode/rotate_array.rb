def rotate(nums, k)

  clone = Array.new(nums)
  clone.each_with_index do |n, i|
    new_index = (i + k) % nums.length
    nums[new_index] = n
  end

  nums
end

# nums = [-1,-100,3,99]
# k = 2

nums = [1,2,3,4,5,6,7]
k = 3

rotate(nums, k)
