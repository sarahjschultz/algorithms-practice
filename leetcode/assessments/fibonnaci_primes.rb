def is_prime?(n)
  return false if n < 2

  (2..n / 2).none? { |i| (n % i).zero? }
end

def fibonacci( n )
  return  n  if ( 0..1 ).include? n
  ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
end

def solution(n)
  seq = []

  n.times do |num|
    seq << fibonacci(num)
  end

  pp seq.filter { |num| is_prime?(num) }
end

n = 6
solution(n)
