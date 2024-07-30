def lowest_common_ancestor(root, p, q)
  curr = root
  pVal = p.val
  qVal = q.val

  until curr.nil?
    parentVal = curr.val
    if pVal > parentVal && qVal > parentVal
      # Traverse over the right subtree
      curr = curr.right
    elsif pVal < parentVal && qVal < parentVal
      # Traverse over the left subtree
      curr = curr.left
    else
      return curr
    end
  end
end

root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5]
p    = 2
q    = 8
# output: 6

# root = [6,2,8,0,4,7,9,null,null,3,5]
# p = 2
# q = 4
# output: 2

lowest_common_ancestor(root, p, q)
