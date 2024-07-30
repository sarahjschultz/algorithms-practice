def max_profit(prices)
  return 0 if [0, 1].include?(prices.length)

  all_time_low = prices[0]
  max_profit = 0

  # We do not need to run the first because
  # we have set it as our all_time_low
  prices[1..prices.length - 1].each do |p|
    current_diff = p - all_time_low
    max_profit = [max_profit, current_diff].max
    all_time_low = [all_time_low, p].min
  end

  max_profit
end

# prices = [7,6,4,3,1]
# prices = [7, 1, 5, 3, 6, 4]
prices = [2, 4, 1]
# prices = [1, 2]
max_profit(prices)
