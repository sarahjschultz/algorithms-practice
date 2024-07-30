def merge_lists(list1, list2)
  return list2 if list1.nil?
  return list1 if list2.nil?

  head = nil

  if list1 < list2
    head  = list1
    list1 = list1.next
  else
    head  = list2
    list2 = list2.next
  end

  head.next = merge_lists(list1, list2)
  head
end

def merge_k_lists(lists)
  while lists.length > 1
    merged_lists = []

    i = 0
    while i < lists.length
      l1 = lists[i]
      l2 = i + 1 < lists.length ? lists[i + 1] : nil
      merged_lists << merge_lists(l1, l2)

      i += 2
    end

    lists = merged_lists
  end

  lists[0]
end

def merge_k_lists(lists)

  # While we have more than 1 lists to examine
  while lists.length > 1
    merged_lists = []

    i = 0

    # We loop through our set of lists, examining them
    # Two by two
    while i < lists.length
      l1 = lists[i]
      # If we are at the end of our lists, i + 1 will not be defined
      # So we return nil. Our merge function can handle nil
      l2 = i + 1 < lists.length ? lists[i + 1] : nil

      merged_lists << merge_lists(l1, l2)

      # Then we skip ahead by 2
      i += 2
    end

    # We overwrite our lists list with our merged set
    lists = merged_lists

  end

  # We should return the first list
  # Which is also the only list remaining
  lists.first
end
