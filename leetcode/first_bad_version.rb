def first_bad_version(n)
  left  = 1
  right = n

  while left < right
    mid = (left + right) / 2

    if is_bad_version(mid)
      right = mid
    else
      left = mid + 1
    end
  end

  left

end
