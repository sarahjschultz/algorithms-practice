def is_valid?(maze, row, col)
  row >= 0 && col >= 0 && row < maze.length && col < maze.first.length
end

def valid_neighbors(maze, row, column)
  indices = [[row - 1, column], [row + 1, column], [row, column - 1], [row, column + 1]]

  indices.select do |pair|
    r = pair.first
    c = pair.last

    pp "The row value of our neighbor is: #{r}"
    pp "The col value of our neighbor is: #{c}"

    is_valid?(maze, r, c) && maze[r][c].zero?
  end
end

def solution(maze, n)
  start_position = [0, 0]
  end_position = [n - 1, n - 1]
  is_possible = false

  q = Queue.new
  q << start_position

  visited = Set.new

  while q.length.positive?
    position = q.shift
    row      = position[0]
    col      = position[1]

    visited << position
    is_possible = true if position == end_position
    break if position == end_position

    neighbors = valid_neighbors(maze, row, col)

    neighbors.each do |neigh|
      nr = neigh[0]
      nc = neigh[1]
      q << [nr, nc] unless visited.include?(neigh)
    end
  end
  is_possible
end

maze = [[0, 0, 1], [1, 0, 0], [1, 1, 0]]
pp solution(maze, 3)
