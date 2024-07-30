def flipping_bits(n)
  multiplier = 2**32 - 1

  n ^ multiplier
end

test_n = 3
flipping_bits(test_n)
# 4294967292
