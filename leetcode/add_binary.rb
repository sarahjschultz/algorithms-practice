def add_binary(a, b)
  sum = a.to_i(2) + b.to_i(2)
  sum.to_s(2)
end

a = "11"
b = "1"

add_binary(a, b)
