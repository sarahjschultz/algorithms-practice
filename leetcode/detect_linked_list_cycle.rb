def has_cycle(head)
  nodes_seen   = {}
  current_node = head

  while !current_node.nil?
    if nodes_seen[current_node].nil?
      nodes_seen[current_node] = 1
      current_node             = current_node.next
    else
      return true
    end
  end

  false
end
