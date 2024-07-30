def top_k_frequent(nums, k)
  counts   = {}
  freq     = Array.new(nums.length + 1) { [] }
  solution = []

  nums.each do |n|
    counts[n].nil? ? counts[n] = 1 : counts[n] += 1
  end

  counts.each_pair do |num, count|
    freq[count] << num
  end

  i = freq.length - 1

  while i >= 0
    freq[i].each do |n|
      solution << n
      if solution.length == k
        pp solution
        return solution
      end
    end

    i -= 1
  end
end

# nums = [1, 1, 1, 2, 2, 3]
# k    = 2
#
nums = [5, 3, 1, 1, 1, 3, 73, 1]
k    = 2

# nums = [3, 0, 1, 0]
# k    = 1

top_k_frequent(nums, k)
