def dfs_symmetric_check(left_node, right_node)
  return true if left_node.nil? && right_node.nil?
  return false if left_node.val && right_node.nil?
  return false if left_node.nil? && right_node.val

  left_node.val == right_node.val && dfs_symmetric_check(left_node.left, right_node.right) && dfs_symmetric_check(left_node.right, right_node.left)
end

def is_symmetric(root)
  dfs_symmetric_check(root.left, root.right)
end

