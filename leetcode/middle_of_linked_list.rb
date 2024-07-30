# MINE
def middle_node(head)

  current = head
  seen    = []

  until current.nil?
    seen << current.val
    current = current.next
  end

  mid = seen.length / 2

  mid.times do
    head = head.next
  end

  head
end

# Fast and Slow Pointers
def middle_node(head)
  slow = head
  fast = head

  while !fast.nil? and !fast.next.nil?
    slow = slow.next
    fast = fast.next.next
  end

  slow
end
