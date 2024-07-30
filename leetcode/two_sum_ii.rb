def two_sum(numbers, target)
  left  = 1
  right = numbers.length

  while left < right
    sum = numbers[left] + numbers[right]
    if sum == target
      return [left + 1, right + 1]
    elsif sum < target
      left += 1
    else
      right -= 1
    end
  end
end

numbers = [2, 7, 11, 15]
target  = 9
two_sum(numbers, target)
