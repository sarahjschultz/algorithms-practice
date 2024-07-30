def remove_duplicates(nums)
  return 1 if nums.length == 1
  return 2 if nums.length == 2

  solved_marker = 0

  nums.each_with_index do |num, i|
    if num != nums[solved_marker]
      solved_marker += 1
      nums[solved_marker] = num
    elsif num == nums[solved_marker] && nums[solved_marker - 1] != num && i != solved_marker
      solved_marker += 1
      nums[solved_marker] = num
    end
  end
  solved_marker + 1
  pp nums
end

# nums = [1,1,2]
# nums = [1,2,3]
# nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
# nums = [1,2]
nums = [1,1,1]
remove_duplicates(nums)
