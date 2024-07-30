def timeConversion(s)
  hours    = s[0..1].to_i
  minutes  = s[3..4]
  seconds  = s[6..7]
  suffix   = s[8..9]
  newHours = ""

  pp hours
  newHours = if hours == 12 && suffix.match(/AM/)
               "00"
             elsif (1..11).include?(hours) && suffix.match(/AM/) # 1-11
               hours
             elsif hours == 12 && suffix.match(/PM/)
               hours
             else
               hours + 12
             end

  newHours.to_s.rjust(2, "0").concat(":").concat(minutes).concat(":").concat(seconds)
end

pp timeConversion("06:40:03AM")
