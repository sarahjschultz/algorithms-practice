class Robot
  def initialize; end

  def turnRight; end
  def turnLeft; end
  def move; end
  def clean; end
end

def backtrack(x, y, direction)

end

def go_back(robot)
  # Rotate 180 degrees
  2.times { robot.turnRight() }

  robot.move()

  # Rotate 180 degrees to face in the same direction
  2.times { robot.turnRight() }
end

def clean_room(robot)
  directions = [[-1, 0], [0, 1], [1, 0], [0, -1]] # up, right, down, left
  visited    = Set.new

end
