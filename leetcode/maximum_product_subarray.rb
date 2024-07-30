def max_products(nums)
  return nums.first if nums.length == 1

  current_max = current_min = 1 # set these to the identity element
  best_max    = nums.first

  nums.each do |num|
    max_with_num = current_max * num # tmp store our max * this element
    min_with_num = current_min * num

    current_max = if num > max_with_num && num > min_with_num
                    num
                  elsif max_with_num > num && max_with_num > min_with_num
                    max_with_num
                  else
                    min_with_num
                  end

    current_min = if num < max_with_num && num < min_with_num
                    num
                  elsif max_with_num < num && max_with_num < min_with_num
                    max_with_num
                  else
                    min_with_num
                  end

    if current_max > best_max
      best_max = current_max
    end

  end
  pp best_max
end

# nums = [2, 3, -2, 4]
# nums = [-2,0,-1]
nums = [-2, 3, -4]
# nums = [0, 2]
# nums = [2, 3, -2, 4]

max_products(nums)
