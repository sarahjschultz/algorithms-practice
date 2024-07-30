def anagram_mappings(nums1, nums2)
  nums2_map = Hash.new { |h, k| h[k] = [] }
  solution = []

  nums2.each_with_index do |num, i|
    nums2_map[num] << i
  end

  nums1.each_with_index do |num, i|
    solution[i] = nums2_map[num].pop
  end

  pp solution

end

nums1 = [12, 28, 46, 32, 50]
nums2 = [50, 12, 32, 46, 28]
anagram_mappings(nums1, nums2)
