def deepest_leaves_sum(root)
  deepest_sum = 0
  depth       = 0
  stack       = [(root, 0)]

  while stack

    top_of_stack  = stack.pop
    node          = top_of_stack[0]
    current_depth = top_of_stack[1]

    if node.left.nil? && node.right.nil?
      if depth < current_depth
        deepest_sum = node.val
        depth       = current_depth
      elsif depth == current_depth
        deepest_sum += node.val
      else
        if node.right
          stack << (node.right, current_depth + 1)
        end

        if node.left
          stack << (node.left, current_depth += 1)
        end
      end
    end

    deepest_sum
  end
end
