def climb_stairs(i, n)
  return 0 if i > n

  return 1 if i == n

  return climb_stairs(i + 1, n) + climb_stairs(i + 2, n) + climb_stairs(i + 3, n)
end

def solution(n)
  climb_stairs(0, n)
end

# n = 3 #4

n = 4 #7
solution(n)
