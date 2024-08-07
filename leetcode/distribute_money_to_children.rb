def dist_money(money, children)
  # Return -1 (impossible) if we cannot give every child at least 1
  return -1 if money < children

  # Return children if all children can get 8
  return children if children * 8 == money

  # Now distribute 1 to every child to satisfy first constraint
  money -= children

  # If we don't have at least 7 leftover, then no one can get 8
  # So we return 0
  return 0 if money < 7
  # If giving EVERY child 8 would leave money leftover, then we know
  # at least one of the children needs to get the remainder, so we
  # return one less than total children for our answer
  return children - 1 if money > children * 7

  # Divide money by 7 to know how many children can get exactly 8 (they already have 1)
  # Keep the remainder for future calcs
  eights, rem = money.divmod(7)

  # If we have one fewer eights than we have children AND our remainder is exactly 3,
  # then we need to avoid giving the non-8 child 4 by taking away one 8 and redistributing
  # This means we will have eights - 1 as our maximum 8 distribution
  # Otherwise, we can always avoid 4, and thus we return all the eights as our answer
  if eights == children - 1 && rem == 3
    eights - 1
  else
    eights
  end
end

# money    = 20
# children = 3

# money    = 17
# children = 2

# money = 16
# children = 2

# money    = 11
# children = 2

money    = 23
children = 2

dist_money(money, children)


