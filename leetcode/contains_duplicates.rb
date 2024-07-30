def contains_duplicates(nums)
  seen = {}

  nums.each do |n|
    return true if seen.keys.include?(n)

    seen[n] = true
  end

  false
end

nums = [1, 2, 3, 1]
# nums = [1, 2, 3, 4]

contains_duplicates(nums)
