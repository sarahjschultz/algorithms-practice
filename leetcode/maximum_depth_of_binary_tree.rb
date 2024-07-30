# Recursive DFS
def max_depth(root)
  return 0 if root.nil?

  left_height  = max_depth(root.left)
  right_height = max_depth(root.right)

  1 + [left_height, right_height].max
end
