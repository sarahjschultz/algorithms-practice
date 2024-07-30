def max_area(heights)
  # Left pointer, right pointer
  left  = 0
  right = heights.length - 1

  max = 0

  while left < right

    current_area = [heights[left], heights[right]].min * (right - left)
    max          = [max, current_area].max

    if heights[left] < heights[right]
      left += 1
    else
      right -= 1
    end
  end

  max
end

# heights = [1, 8, 6, 2, 5, 4, 8, 3, 7] # 49

# heights = [1, 1] # 1

# heights = [1, 2, 1] # 2
# heights = [1, 0, 0, 0, 0, 0, 0, 0, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]

# heights = [1, 2] # 1

max_area(heights)
