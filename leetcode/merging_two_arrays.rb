def merge(nums1, m, nums2, n)

  i = j = k = 0

  copy_cat = m.zero? ? [] : nums1[0..m - 1]

  while i < copy_cat.length && j < n && m.positive?
    if copy_cat[i] < nums2[j]
      nums1[k] = copy_cat[i]
      i += 1
    elsif copy_cat[i] > nums2[j]
      nums1[k] = nums2[j]
      j += 1
    elsif copy_cat[i] == nums2[j]
      nums1[k] = copy_cat[i]
      i += 1
    end
    k += 1
  end

  if copy_cat[i]
    copy_cat[i..copy_cat.length - 1].each do |e|
      nums1[k] = e
      k += 1
    end

  end

  if nums2[j]
    nums2[j..nums2.length - 1].each do |e|
      nums1[k] = e
      k += 1
    end
  end

  nums1
end

test_1 = [1,2,3,0,0,0]
m = 3
test_2 = [2,5,6]
n = 3

# test_1 = [0]
# m = 0
# test_2 = [1]
# n = 1

# test_1 = [-1,0,0,3,3,3,0,0,0]
# m = 6
# test_2 = [1,2,2]
# n = 3

# test_1 = [-1,3,0,0,0,0,0]
# m = 2
# test_2 = [0,0,1,2,3]
# n = 5

merge(test_1, m, test_2, n)
