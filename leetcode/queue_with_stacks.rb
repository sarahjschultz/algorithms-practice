# Implement a FIFO queue
# as a stack
class MyQueue
  attr_accessor :stack

  def initialize()
    @stack = []
  end

  # Add element from argument to top of stack
  def push(x)
    @stack.concat(x)
  end

  # Return and remove first element in stack
  def pop()
    @stack.shift
  end

  # Return first element in stack but do
  # not remove
  def peek()
    @stack.first
  end

  # Return true if stack has no elements
  # Return false if stack has elements
  def empty()
    @stack.empty?
  end
end
