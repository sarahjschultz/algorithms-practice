def invert_tree(root)
  unless root.nil?
    # Invert children
    tmp        = root.right
    root.right = root.left
    root.left  = tmp

    # Swap child trees
    invert_tree(root.right)
    invert_tree(root.left)
  end
  root
end
