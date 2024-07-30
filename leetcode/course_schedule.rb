# In this problem you are given a number of courses that you must take as well as a list of prerequisites.
# The prerequisites are ordered such that the second entry is required to complete the first entry
# Our job is to return a boolean value indicating whether or not the course load can be completed successfully

# In this solution we will use Kahn's Algorithm in O(m+n)
def can_finish(num_courses, prerequisites)
  indegree = Array.new(num_courses, 0)
  adj_list = Hash.new { |h, k| h[k] = [] }

  prerequisites.each do |pair|
    course = pair[0]
    prereq = pair[1]

    adj_list[prereq] << course

    # This index works because our course numbers are 0-based
    # And thus we can use an array as buckets
    indegree[course] += 1
  end

  q = Queue.new

  # Initialize our queue with all removable
  # Nodes in our graph. That is, all nodes with no inbound edges
  (0..num_courses - 1).each do |i|
    q << i if indegree[i].zero?
  end

  nodes_visited = 0

  while q.length.positive?
    node          = q.shift
    nodes_visited += 1

    adj_list[node].each do |neighbor|
      indegree[neighbor] -= 1

      q << neighbor if (indegree[neighbor]).zero?
    end
  end

  nodes_visited == num_courses
end

# True
num_courses   = 2
prerequisites = [[1, 0]]

# False
# num_courses   = 2
# prerequisites = [[1, 0], [0, 1]]

can_finish(num_courses, prerequisites)
