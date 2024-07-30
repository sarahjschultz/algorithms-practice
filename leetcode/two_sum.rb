def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |number, index|
    if hash[target - number]
      pp [hash[target - number], index]
    else
      hash[number] = index
    end
  end
end

def two_sum(nums, target)
  index_map = {}
  solution  = []

  nums.each_with_index do |n, i|
    diff = target - n

    if index_map.keys.include?(diff)
      solution << index_map[diff]
      solution << i
    else
      index_map[n] = i
    end
  end

  solution

end

nums   = [3, 2, 4]
target = 6
# [1,2]

# nums   = [3, 3]
# target = 6
# [0,1]

# nums   = [2, 7, 11, 15]
# target = 9
# [0,1]

# nums = [2,5,5,11]
# target = 10
# [1, 2]

two_sum(nums, target)
