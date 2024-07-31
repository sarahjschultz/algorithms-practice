def angle_clock(hour, minutes)
  deg_per_minute = 360 / 60
  deg_per_hour = 360 / 12

  minutes_angle = minutes * deg_per_minute
  hour_angle = ((hour % 12) + (minutes / 60.0)) * deg_per_hour

  diff = (hour_angle - minutes_angle).abs

  [diff, 360 - diff].min
end

# hour    = 12
# minutes = 30
# output: 165

# hour = 3
# minutes = 30
# # output: 75
#
hour = 3
minutes = 15
# # output: 7.5

angle_clock(hour, minutes)
