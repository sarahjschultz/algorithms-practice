def cloneGraph(node)
  @visited = {}

  dfs(node)
end

def dfs(node)
  return node if node.nil?
  return @visited[node] if @visited[node]

  copy           = Node.new(node.val)
  @visited[node] = copy

  copy.neighbors = node.neighbors.map { |n| dfs(n) }
  copy
end
