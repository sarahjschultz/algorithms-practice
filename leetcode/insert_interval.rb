def insert(intervals, new_interval)
  start  = new_interval[0]
  finish = new_interval[1]
  left   = []
  right  = []

  intervals.each do |int|
    if int[1] < start
      left << int
    elsif int[0] > finish
      right << int
    else
      start  = [start, int[0]].min
      finish = [finish, int[1]].max
    end
  end

  pp [*left, [start, finish], *right]

end

# intervals    = [[1, 3], [6, 9]]
# new_interval = [2, 5]

intervals    = [[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]]
new_interval = [4, 8]

insert(intervals, new_interval)
