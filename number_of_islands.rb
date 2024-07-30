def num_islands(grid)
  return 0 if grid.empty?

  row_count = grid.length
  col_count = grid[0].length

  visited = Set.new
  q = Queue.new

  island_count = 0

  (0..row_count).each do |r|
    (0..col_count).each do |c|
      next unless grid[r][c] == "1" && !visited.include?([r, c])

      visited << [r, c]
      q << [r, c]

      while q.length.positive?
        cell = q.shift
        q_row = cell[0]
        q_col = cell[1]

        directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

        directions.each do |dir|
          dr = dir[0]
          dc = dir[1]

          unless (0..row_count).to_a.include?(q_row + dr) && (0..col_count).to_a.include?(q_col + dc) && grid[dr + q_row][dc + q_col] == "1" && !visited.include?([dr + q_row, dc + q_col])
            next
          end

          q << [q_row + dr, q_col + dc]
          visited << [q_row + dr, q_col + dc]

        end
      end

      island_count += 1
    end
  end
  
  pp island_count
end

grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]

num_islands(grid)
