def leftMostColumnWithOne(binary_matrix)
  dimension = binary_matrix.dimensions()
  n         = dimension[0]
  m         = dimension[1]

  i             = 0
  j             = m - 1
  special_index = -1

  while i < n && j >= 0
    result = binary_matrix.get(i, j)
    if result.zero?
      i += 1
    else
      special_index = j
      j             -= 1
    end
  end

  special_index

end

binary_matrix = [[0, 0], [1, 1]]
leftMostColumnWithOne(binary_matrix)
