def dfs(root)
  return [true, 0] if root.nil?

  left  = dfs(root.left)
  right = dfs(root.right)

  balanced = left.first && right.first && (left[1] - right[1]).abs <= 1

  [balanced, 1 + [left[1], right[1].max]]
end

def is_balanced(root)
  dfs(root).first
end

root = [3, 9, 20, null, null, 15, 7]

is_balanced(root)
