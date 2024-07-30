def dist_money(money, children)
  # Guard clause 1: If at least 1 child cannot have 1, then we cannot distribute according to the rules
  pp -1 if money < children
  return -1 if money < children
  # Guard clause 2: If every child can have exactly 8, return the number of children
  pp children if money * 8 == children
  return children if money * 8 == children

  # Now, we give every child at least 1
  money -= children

  # If, by giving everyone 1, we cannot make at least 8 elsewhere, return 0
  pp 0 if money < 7
  return 0 if money < 7
  pp children - 1 if money > children * 7
  return children - 1 if money > children * 7

  # Now, we see how many times we can distribute exactly 7 to another child
  winners, rem = money.divmod(7)

  if money.zero?
    pp winners
  elsif children == winners + 1 && rem == 3
    pp winners - 1
  else
    pp winners
  end
end

# money    = 20
# children = 3

money    = 17
children = 2

# money = 16
# children = 2

# money    = 11
# children = 2

dist_money(money, children)


