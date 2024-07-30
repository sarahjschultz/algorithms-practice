def valid_distribution?(quantities, item_count, total_stores)
  stores_needed = 1
  quantities.each do |q|
    stores_needed += (q / item_count).ceil
    return false if stores_needed > total_stores
  end

  true
end

def minimized_maximum(n, quantities)
  left   = 1
  right  = quantities.max

  while left < right
    midpoint = (right + left) / 2
    if (quantities.sum { |q| (q / midpoint).ceil }) <= n
      right  = midpoint
    else
      left = midpoint + 1
    end

  end

  pp left
end

# 3
# n          = 6
# quantities = [11, 6]

# 5
n          = 7
quantities = [15, 10, 10]
minimized_maximum(n, quantities)
