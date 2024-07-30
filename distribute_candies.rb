def distribute_candies(candies, num_people)
  candy_dist = Array.new(num_people, 0)

  # Number of candy to give to each person
  give = 0
  while candies > 0

    candy_dist[give % num_people] += [candies, give + 1].min
    give += 1
    candies -= give
  end

  pp candy_dist
end

# candies = 7
# num_people = 4

candies = 10
num_people = 3
distribute_candies(candies, num_people)
