def merge_two_lists(list_1, list_2)
  return list_1 if list_2.nil?
  return list_2 if list_1.nil?

  head = nil

  if list_1 > list_2
    head   = list_2
    list_2 = list_2.next
  else
    head   = list_1
    list_1 = list_1.next
  end

  head.next = merge_two_lists(list_1, list_2)

  head
end

list1 = [1, 2, 4]
list2 = [1, 3, 4]
merge_two_lists(list1, list2)


