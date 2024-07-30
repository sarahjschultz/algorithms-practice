def is_valid?(row, col, grid)
  row <= grid.length && row >= 0 && col < grid[0].length && col >= 0 && grid[row][col] == 1
end

def oranges_rotting(grid)
  minutes     = 0
  fresh_count = 0

  q = Queue.new

  grid.each_with_index do |_row, r|
    grid[r].each_with_index do |_col, c|

      fresh_count += 1 if grid[r][c] == 1
      q << [r, c] if grid[r][c] == 2
    end
  end

  directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  while q.length.positive? && fresh_count.positive?
    q_len = q.length

    q_len.times do
      orange_coords = q.shift
      r             = orange_coords[0]
      c             = orange_coords[1]

      directions.each do |dir|
        dr = dir[0]
        dc = dir[1]

        row = dr + r
        col = dc + c

        # If in bounds and fresh, make rotten
        next unless is_valid?(row, col, grid)
        grid[row][col] = 2
        q << [row, col]
        fresh_count -= 1
      end

    end
    minutes += 1
  end

  # If we have no more fresh oranges, we can return our tracked minutes
  # Otherwise we were unable to cause all oranges to become rotten and
  # So it is impossible and we return -1
  fresh_count.zero? ? minutes : -1
end

# Output: 4
grid = [[2, 1, 1], [1, 1, 0], [0, 1, 1]]

# # Output: -1 (impossible)
# grid = [[2, 1, 1], [0, 1, 1], [1, 0, 1]]
oranges_rotting(grid)
