# require 'rubygems'
# require 'algorithms'
#
# def k_closest(points, k)
#   min_heap = []
#
#   for x, y in points
#     dist = x**2 + y**2
#
#     min_heap << [dist, x, y]
#   end
#
#   min_heap = Containers::MinHeap.new(min_heap)
#
#   result = []
#
#   while k > 0
#     _dist, x, y = min_heap.pop
#     result << [x, y]
#     k -= 1
#   end
#
#   result
# end

# O(nlogn)
def k_closest(points, k)
  distance_tuples = []
  solution        = []

  for x, y in points
    distance = x ** 2 + y ** 2
    distance_tuples << [distance, x, y]
  end

  distance_tuples = distance_tuples.sort
  pp distance_tuples

  k.times do
    t = distance_tuples.shift
    solution << [t[1], t[2]]
  end

  solution
end

points = [[1, 3], [-2, 2]]
k      = 1
# output [-2, 2]

k_closest(points, k)
