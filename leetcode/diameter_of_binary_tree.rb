def dfs(root)
  return -1 if root.nil?

  left  = dfs(root.left)
  right = dfs(root.right)

  diameter = 2 + left + right
  height   = 1 + [left, right].max

  @max = [diameter, @max].max

  height
end

def diameter_of_binary_tree(root)
  @max = 0

  dfs(root)

  @max
end
