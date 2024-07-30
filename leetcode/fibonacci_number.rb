def fib(n)
  return 0 if n.zero?

  # This usage of memoization is called dynamic programming
  @memo ||= []

  if !@memo[n].nil?
    @memo[n]
  end

  if n <= 2
    result = 1
  else
    result = fib(n - 1) + fib(n - 2)
  end
  @memo[n] = result

  pp result
end

n = 4

fib(n)
