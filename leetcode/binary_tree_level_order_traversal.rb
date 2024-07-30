def level_order(root)
  solution = []

  q = Queue.new

  q << root

  while q.length.positive?
    q_length = q.length

    level = []

    q_length.times do
      node = q.shift

      next unless !node.nil?

      level << node.val
      q.append(node.left)
      q.append(node.right)

    end

    solution << level if level.length.positive?
  end

  solution
end
