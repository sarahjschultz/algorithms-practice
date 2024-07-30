def dist_money(money, children)

  pp "money is: #{money}"
  pp "children is: #{children}"

  # Too little money to give $1 to each child
  pp -1 if money < children
  return -1 if money < children

  # Surplus of money, all children get 8 except 1 gets rest
  pp children - 1 if money > 8 * children
  return children - 1 if money > 8 * children

  ### DISTRIBUTION
  # Give 1 to every child first
  money -= children

  # Now, we divide the remaining money by 7
  quot, rem = money.divmod(7)

  pp "quotient is: #{quot}"
  pp "remainder is: #{rem}"

  pp quot - 1 if rem == 3 && quot + 1 == children

  return quot - 1 if rem == 3 && quot + 1 == children

  quot
end

money = 20
children = 3

dist_money(money, children)


