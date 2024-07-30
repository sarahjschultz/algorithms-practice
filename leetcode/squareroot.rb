def sqrt(x)
  return x if x < 2

  left  = 2
  right = x / 2

  while left <= right
    mid = (left + right) / 2

    square = mid * mid

    if square > x
      right = mid - 1
    elsif square < x
      left = mid + 1
    else
      pp mid
      return mid
    end
  end
  pp right
end

# Time: 0(log(n))
# Space: O(1)

# x = 4
x = 8

sqrt(x)
