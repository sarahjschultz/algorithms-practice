def solution(matrix)
  n       = matrix[0].length
  i_range = (0..(n / 2 + n % 2))

  i_range.each do |i|
    j_range = (0..n / 2)

    j_range.each do |j|
      tmp                          = matrix[n - 1 - j][i]
      matrix[n - 1 - j][i]         = matrix[n - 1 - i][n - j - 1]
      matrix[n - 1 - i][n - j - 1] = matrix[j][n - 1 - i]
      matrix[j][n - 1 - i]         = matrix[i][j]
      matrix[i][j]                 = tmp
    end
  end

  pp matrix
end

matrix = [[1, 2], [3, 4]]
solution(matrix)

