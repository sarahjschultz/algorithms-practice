# recipients is a hash, keyed by identifier whose value is the amount owed
# money is the amount of money we have to distribute
# RULE 1: No one paid more than they are owed
# RULE 2: Divide amount as evenly as possible among recipients

def pay_people(recipients, money)
  owed = recipients.values.reduce(&:+)

  off_by = 1 - money.to_f / owed

  recipients.each_pair do |payee, amt|
    recipients[payee] = amt - (amt * off_by)
  end

  pp recipients
end

recipients = { c: 10, b: 10, a: 10, d: 10 }
money = 38
pay_people(recipients, money)
# output: { c: 9, b: 10, a: 10, d: 9 }
