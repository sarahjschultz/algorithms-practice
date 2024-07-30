def remove_duplicates(nums)
  return 1 if nums.length == 1

  i = j = 0
  temp = []

  while i < nums.length
    if nums[i] != nums[i + 1]
      temp << nums[i]
    end
    i += 1
  end

  while j < nums.length
    nums[j] = !temp[j].nil? ? temp[j] : nil
    j += 1
  end

  temp.length

  # # Values at this index and below are as we want them in the solution.
  # # The first value (index 0) will always be the same as in the input.
  # solved_marker = 0
  #
  # nums.each_with_index do |num, i|
  #   # If we encounter a number that's not in the solution yet, insert it
  #   # at the next open spot and increment the solved_marker.
  #   if num != nums[solved_marker]
  #     solved_marker += 1
  #     nums[solved_marker] = num
  #   end
  # end
  #
  # # The length of the unique part of the array will be one greater than its highest index
  # pp solved_marker + 1
  # pp nums
end

# nums = [1,1,2]
nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
remove_duplicates(nums)
