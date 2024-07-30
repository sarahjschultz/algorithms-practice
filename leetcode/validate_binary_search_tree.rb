def validate(node, left, right)
  return true if node.nil?

  return false unless node.val > left && node.val < right

  validate(node.left, left, node.val) && validate(node.right, node.val, right)
end

def is_valid_bst(root)
  validate(root, -Float::INFINITY, Float::INFINITY)
end

root = []
is_valid_bst(root)
