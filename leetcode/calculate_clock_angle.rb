def angle_clock(hour, minutes)
  min_angle  = 6
  hour_angle = 30

  angle_from_minutes = minutes * min_angle
  calc_hour = hour % 12
  contr_mins = (minutes.to_f / 60.0)

  angle_from_hour = (calc_hour + contr_mins) * hour_angle

  diff = (angle_from_hour - angle_from_minutes).abs

  [diff, 360 - diff].min
end

hour    = 12
minutes = 30
# output: 165

# hour = 3
# minutes = 30
# # output: 75
#
# hour = 3
# minutes = 15
# # output: 7.5

angle_clock(hour, minutes)
