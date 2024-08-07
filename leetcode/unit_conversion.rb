SOURCE_TO_TARGET_MULTIPLIERS = { feet: { meters: 3.28, kilometers: 3280 }, meters: { feet: 0.3049, kilometers: 1000 } }.freeze

def convert(distance, source_units, target_units)
  return 'Distance must be a number' unless distance.is_a? Numeric

  return 'Please enter a valid unit of measurement' unless ['feet', 'meters'].include?(target_units.downcase)

  # TODO: Consolidate these two guards into one
  return 'Please enter a valid unit of measurement' unless ['feet', 'meters'].include?(source_units.downcase)

  distance * SOURCE_TO_TARGET_MULTIPLIERS[target_units.to_sym][source_units.to_sym]
end

puts convert(100, "meters", "feet") # 30ish feet
puts convert(100, "feet", "meters") # 327 meters

# We have a prototype of a distance converter function. It converts between feet and meters successfully. We would like to expand this method to be production ready and to handle additional units. The additional units are:
#
#                                                                                                                                                                                                                           Kilometers
# Miles
# Nautical Leagues
# In this pattern the user will submit their input distance, the unit used to measure that distance, and the unit they wish to have the distance returned in.
#
#   For the purposes of this exercise you can assume:
#
#                                               1 Meter is 3.28 feet
# 1 Kilometer is 1000 meters
# 1 Mile is 5280 feet
# 1 Nautical League is 18228.3 feet
# While our prototype code is written in Ruby, feel free to write your production ready solution in a language of your choice.
