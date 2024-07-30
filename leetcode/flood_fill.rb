def is_valid(image, row, col)
  row >= 0 && col >= 0 && row < image.length && col < image.first.length
end

def neighbors(image, row, col, color)
  indices = [[row - 1, col], [row + 1, col], [row, col - 1], [row, col + 1]]

  indices.select do |pair|
    r = pair.first
    c = pair.last

    pp "The row value of our neighbor is: #{r}"
    pp "The col value of our neighbor is: #{c}"

    is_valid(image, r, c) && image[r][c] == color
  end
end

def flood_fill(image, row, col, new_color)
  start_color = image[row][col]

  initial = [row, col]
  q       = Queue.new
  q << initial

  visited = Set.new

  while q.length.positive?
    front = q.shift
    r     = front[0]
    c     = front[1]
    visited << front
    image[r][c] = new_color

    neighbs = neighbors(image, r, c, start_color)

    neighbs.each do |neighbor|
      nr = neighbor[0]
      nc = neighbor[1]
      q << [nr, nc] unless visited.include?(neighbor)
    end

  end
  image
end

image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
row   = 1
col   = 1
color = 2

flood_fill(image, row, col, color)
