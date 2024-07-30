def flipping_matrix(matrix)
  matrix_dim = matrix.length
  sub_dim    = matrix_dim / 2

  i = 0
  while i < sub_dim
    matrix[i][i] > matrix[matrix_dim - 1][i] # 112 > 62
    matrix[i][i] > matrix[i][matrix_dim - 1] # 112 > 119
    matrix[i][i] > matrix[matrix_dim - 1][matrix_dim - 1] # 112 > 108

    matrix[i][i + 1] > matrix[i][i + 2] # 42 > 83
    matrix[i][i + 1] > matrix[matrix_dim - 1][i + 1] # 42 > 98
    matrix[i][i + 1] > matrix[matrix_dim - 1][i + 2] # 42 > 114

    matrix[i + 1][i] > matrix[i + 1][matrix_dim - 1] # 56 > 49
    matrix[i + 1][i] > matrix[i + 2][i] # 56 > 15
    matrix[i + 1][i] > matrix[i + 2][matrix_dim - 1] # 56 > 43

    matrix[i + 1][i + 1] > matrix[i + 1][i + 2] # 125 > 56
    matrix[i + 1][i + 1] > matrix[i + 2][i + 1] # 125 > 78
    matrix[i + 1][i + 1] > matrix[i + 2][i + 2] # 125 > 101

    # TODO: Need two pointers -- one for top level array traversal
    # One for sub array traversal
    # Second pointer will stop at n (which is half matrix dimension)
    # First pointer will stop at n (half matrix dimension)

    i += 1
  end
end

test_m = [[1, 2], [3, 4]]
# 4

flipping_matrix(test_m)

# 414 = 119 + 114 + 125 + 56
# Operation: You can only reverse rows or columns
#
# test_m = [[112, 42, 83, 119],
#           [56, 125, 56, 49],
#           [15, 78, 101, 43],
#           [62, 98, 114, 108]]
