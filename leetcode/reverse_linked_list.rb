def reverse_list(head)
  current_node = head
  prev_node    = nil # node the current_node will point to

  while !current_node.nil?
    # Reconfigure pointers from the current node
    next_node         = current_node.next # This node was following CURR but now will precede
    current_node.next = prev_node # The new node that follows CURR is the tail we are building

    # Set Up Next Round
    prev_node    = current_node # The new tail will be what our CURR node is
    current_node = next_node # And now we loop again with the node that preceded CURR
  end

  prev_node
end
