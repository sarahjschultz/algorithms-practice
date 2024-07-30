def contains_duplicates(nums)
  count_map = {}

  nums.each do |n|
    count_map[n] = count_map[n] ||= 0
    count_map[n] += 1
    return true if count_map[n] > 1
  end

  false
end

def contains_duplicates(nums)
  return false if [0, 1].include?(nums.length)

  solution = false
  counts = {}

  nums.each do |n|
    counts[n].nil? ? counts[n] = 1 : counts[n] += 1
    solution = true if counts[n] > 1
  end

  solution

end

# nums = [1, 2, 3, 1]
nums = [1,2,3,4]

contains_duplicates(nums)
