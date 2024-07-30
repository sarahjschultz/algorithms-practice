def majority_element(nums)
  counts     = Hash.new { |k, v| k[v] = 0 }
  threshhold = nums.length / 2
  majority   = nil

  nums.each do |n|
    counts[n] += 1
    majority  = n if counts[n] > threshhold
  end
  pp majority
end

nums = [2, 2, 1, 1, 1, 2, 2]
# nums = [3, 2, 3]
# nums = [-1,1,1,1,2,1]
# nums = [3,3,4]
majority_element(nums)
