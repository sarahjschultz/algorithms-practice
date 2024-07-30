require 'date'

# @param {String} date1
# @param {String} date2
# @return {Integer}
def days_between_dates(date1, date2)
  date_1_parsed = date1.split("-").map(&:to_i)
  date_2_parsed = date2.split("-").map(&:to_i)

  pp date_1_parsed
  pp date_2_parsed

  a = DateTime.new(date_1_parsed[0], date_1_parsed[1], date_1_parsed[2])
  b = DateTime.new(date_2_parsed[0], date_2_parsed[1], date_2_parsed[2])

  (a - b).to_i.abs
end

date1 = "2019-06-29"
date2 = "2019-06-30"
days_between_dates(date1, date2)
