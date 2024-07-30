def counting_valleys(_steps, path)
  counts = { mountains: 0, valleys: 0 }

  path.chars.reduce(0) do |elevation, step|
    if step == "U"
      counts[:valleys] += 1 if (elevation + 1).zero? & (elevation.negative?)
      elevation += 1
    elsif step == "D"
      counts[:mountains] += 1 if (elevation - 1).zero? & (elevation.positive?)
      elevation -= 1
    end
    elevation
  end

  puts counts[:valleys]
end

test_steps = 0
test_path  = %Q(UDDDUDUU)
counting_valleys(test_steps, test_path)
# Expected result: 1
